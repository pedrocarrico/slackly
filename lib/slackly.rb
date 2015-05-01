require 'net/http'
require 'json'

class Slackly
  class InvalidMessageTextError < StandardError; end

  attr_accessor :webhook_uri
  attr_accessor :client_options

  DEFAULT_OPTIONS = {
    username: 'slackly',
    icon_emoji: ':sunglasses:',
    unfurl_links: true
  }.freeze

  def initialize(webhook_url, client_options = {})
    @webhook_uri = URI.parse(webhook_url)
    @client_options = DEFAULT_OPTIONS.merge(client_options)
  end

  def message!(message_options = {})
    fail Slackly::InvalidMessageTextError, 'Please supply a valid message text' if message_options[:text].nil?

    request = Net::HTTP::Post.new(webhook_uri.request_uri)
    request.body = "payload=#{client_options.merge(message_options).to_json}"
    Net::HTTP.start(webhook_uri.host, webhook_uri.port, use_ssl: webhook_uses_ssl?) do |http|
      http.request(request)
    end
  end

  def message(message_options = {})
    message!(message_options)
  rescue => exception
    STDERR.puts "Error while sending message to Slack: #{exception.message}"
  end

  private

  def webhook_uses_ssl?
    'https' == webhook_uri.scheme
  end
end

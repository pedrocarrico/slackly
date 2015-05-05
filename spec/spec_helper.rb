require 'bundler/setup'
Bundler.setup

require 'coveralls'
Coveralls.wear!

require 'slackly'

require 'pry'
require 'webmock/rspec'

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.order = 'random'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.raise_errors_for_deprecations!
end

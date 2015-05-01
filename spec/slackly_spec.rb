require 'spec_helper'

describe Slackly do
  context 'when initialized with a valid webhook URL' do
    let(:webhook_url) { 'https://hooks.example.com/services/B34D566L8/Y03L7FBCG/kD0ty1hTFjwWc7TagKLK6n1t' }
    subject { described_class.new(webhook_url) }

    describe '#client_options' do
      it 'has the default client options' do
        expect(subject.client_options).to eq(Slackly::DEFAULT_OPTIONS)
      end
    end

    describe '#message!' do
      context 'with valid message text' do
        let(:message_options) { { text: 'testing' } }

        it 'posts the message to the webhook' do
          stub_request(:post, webhook_url)
          subject.message!(message_options)
          body = 'payload={"username":"slackly","icon_emoji":":sunglasses:","unfurl_links":true,"text":"testing"}'
          expect(WebMock).to have_requested(:post, webhook_url).with(body: body)
        end
      end

      context 'with a nil message text' do
        let(:message_options) { {} }

        it 'raises an error' do
          error_message = 'Please supply a valid message text'
          expect { subject.message!(message_options) }.to raise_error(Slackly::InvalidMessageTextError, error_message)
        end
      end
    end

    describe '#message' do
      context 'with valid message text' do
        let(:message_options) { { text: 'testing' } }
      end

      context 'with a nil message text' do
        let(:message_options) { {} }

        it 'outputs an error message' do
          error_message = "Error while sending message to Slack: Please supply a valid message text\n"
          expect { subject.message(message_options) }.to output(error_message).to_stderr
        end
      end
    end
  end

  context 'when initialized with a valid webhook URL and custom client options' do
    let(:webhook_url) { 'https://hooks.example.com/services/B34D566L8/Y03L7FBCG/kD0ty1hTFjwWc7TagKLK6n1t' }
    let(:custom_client_options) { { username: 'testing', icon_emoji: ':ghost:' } }
    subject { described_class.new(webhook_url, custom_client_options) }

    describe '#client_options' do
      it 'has the custom client options merged with the default client options' do
        expect(subject.client_options).to eq(Slackly::DEFAULT_OPTIONS.merge(custom_client_options))
      end
    end
  end

  context 'when initialized with an invalid webhook URL' do
    let(:webhook_url) { 'hbc://.-INVALID_URL!' }

    it 'raises an error' do
      expect { described_class.new(webhook_url) }.to raise_error(URI::Error)
    end
  end
end

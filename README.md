# Slackly
[![Build Status](https://secure.travis-ci.org/pedrocarrico/slackly.png)](http://travis-ci.org/pedrocarrico/slackly) [![Dependency Status](https://gemnasium.com/pedrocarrico/slackly.png?travis)](https://gemnasium.com/pedrocarrico/slackly) [![Gem Version](https://badge.fury.io/rb/slackly.png)](http://badge.fury.io/rb/slackly) [![Code Climate](https://codeclimate.com/github/pedrocarrico/slackly/badges/gpa.svg)](https://codeclimate.com/github/pedrocarrico/slackly) [![Coverage Status](https://coveralls.io/repos/pedrocarrico/slackly/badge.svg)](https://coveralls.io/r/pedrocarrico/slackly)

## Description
Slackly is a simple and easy way to send messages to your Slack channels using the
[incoming webhooks](https://api.slack.com/incoming-webhooks) integration. You can use it directly in your code or
through the command line.

## Installation
```
gem install slackly
```

## Usage
In your code:
```ruby
s = Slackly.new(webhook_url)
s.message(text: 'Hello from Slackly')
```

Command line:
```bash
slackly message 'Hello from Slackly!'
```

## Configuration
In your code:
```ruby
# these options will be the default client options and may be overriden by the message options
client_options = {
  username: 'slackly',
  icon_emoji: ':ghost:'
}
s = Slackly.new(webhook_url, client_options)

# these options will be sent for this message and will override any client options
message_options = {
  text: 'Hello from Slackly',
  channel: '#slackly'
}
s.message(message_options)
```

The command line needs a JSON configuration file in order to configure the webhook, it defaults to './slackly.json'
but you can override it with the `-c` option.
The JSON configuration file must must have a `webhook_url` option in order for the command line to work:

```bash
slackly message 'Hello from Slackly!' -c path_to/config.json
```

Both the code version and JSON configuration file accept any configuration option provided by Slack as described in
[here](https://api.slack.com/incoming-webhooks).

## Contributing

1. Fork it (https://github.com/pedrocarrico/slackly/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License
Slackly is released under the [MIT License](http://www.opensource.org/licenses/MIT).

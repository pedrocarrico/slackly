require_relative 'lib/slackly/version'

Gem::Specification.new do |s|
  s.name        = 'slackly'
  s.version     = Slackly::VERSION
  s.date        = Time.now.strftime('%Y-%m-%d')
  s.summary     = 'Slackly'
  s.description = 'Slackly is a simple and easy way to send messages to your Slack channels using the incoming'\
                  ' webhooks integration.'
  s.authors     = ['Pedro Carriço']
  s.email       = 'pedro.carrico@gmail.com'
  s.files       = ['lib/slackly.rb', 'lib/slackly/version.rb', 'slackly.gemspec', 'LICENSE', 'README.md']
  s.executables = 'slackly'
  s.homepage    = 'http://www.github.com/pedrocarrico/slackly'
  s.license     = 'MIT'
  s.required_ruby_version = '>= 2.0'

  s.add_runtime_dependency 'json', '~> 1.8', '>= 1.8.2'

  s.add_development_dependency 'bundler', '~> 1.8', '>= 1.8.2'
  s.add_development_dependency 'rubocop', '~> 0.30.1', '>= 0.30.1'
end

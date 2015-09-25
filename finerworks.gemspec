Gem::Specification.new do |s|
  s.name = 'finerworks'
  s.summary = 'Ruby interface for the FinerWorks Web API'
  s.description = 'This gem wraps the FinerWorks Web API in order to provide an easy way to utilize the API in Ruby apps.'
  s.homepage = 'https://github.com/jfredrickson/finerworks'
  s.version = '0.1.2'
  s.authors = ['Jeff Fredrickson']
  s.email = %w(jeff.fredrickson@gmail.com)
  s.files = %w(lib/finerworks.rb) + Dir['lib/finerworks/*.rb']
  s.license = 'MIT'
  s.required_ruby_version = '~> 1.9'

  s.add_runtime_dependency 'json', '~> 1.4'
  s.add_runtime_dependency 'hashie', '~> 3.4'

  s.add_development_dependency 'minitest', '~> 5.8'
  s.add_development_dependency 'webmock', '~> 1.21'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'simplecov', '~> 0.10'
end

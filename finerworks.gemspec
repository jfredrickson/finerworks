Gem::Specification.new do |s|
  s.name = 'finerworks'
  s.summary = 'Ruby interface for the FinerWorks Web API'
  s.version = '0.0.0'
  s.authors = ['Jeff Fredrickson']
  s.email = %w(jeff.fredrickson@gmail.com)
  s.files = %w(lib/finerworks.rb) + Dir['lib/finerworks/*.rb']
  s.license = 'MIT'

  s.add_runtime_dependency 'json', "~> 1.4"
end

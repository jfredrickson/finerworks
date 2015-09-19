require 'rake/testtask'

Rake::TestTask.new do |task|
  task.libs << %w(test lib)
  task.pattern = 'test/finerworks/test_*.rb'
end

task :build do
  system "gem build finerworks.gemspec"
end

task default: :test

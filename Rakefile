require "bundler/setup"
require "rake/testtask"

$:.unshift(File.expand_path('../lib', __FILE__))

Rake::TestTask.new do |test|
  test.libs << "test"

  test.test_files = FileList["test/*_test.rb"]
end

task default: :test

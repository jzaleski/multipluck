#!/usr/bin/env rake

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

begin
  require 'rdoc/task'
rescue LoadError
  require 'rdoc/rdoc'
  require 'rake/rdoctask'
  RDoc::Task = Rake::RDocTask
end

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'Multipluck'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.md')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs += %w[lib test]
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

def run_rake_task_in_dummy(task)
  abort unless system("cd test/dummy && bundle exec rake #{task}")
end

Dir.glob(File.expand_path('../lib/tasks/*.rake', __FILE__)).each { |f| load f }

task :default => :test

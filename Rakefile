require 'foodcritic'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

task default: :ci_merge

namespace :syntax do
  desc "Check whether cookbook contains ruby syntax errors in .rb and .erb files"
  task :knife_syntax do
    puts "Running knife cookbook test ... "
    sh "knife cookbook test -a -o ."
    puts "knife cookbook test FINISHED."
  end
end
desc "Run all syntax tests"
task :syntax do
  Rake.application.in_namespace(:syntax){|x| x.tasks.each{|t| t.invoke}}
end

namespace :style do
  FoodCritic::Rake::LintTask.new do |t|
    t.options = {:fail_tags => ['correctness']}
  end
end
desc "Run all style tests"
task :style do
  Rake.application.in_namespace(:style){|x| x.tasks.each{|t| t.invoke}}
end

namespace :unit do
  desc "Run rspec and chefspec tests"
  RSpec::Core::RakeTask.new do |t|
    t.pattern = "spec/*_spec.rb"
  end
end
desc "Run all unit tests"
task :unit do
  Rake.application.in_namespace(:unit){|x| x.tasks.each{|t| t.invoke}}
end

desc "Run all tests"
task :ci_merge do
  Rake::Task['syntax'].invoke
  Rake::Task['style'].invoke
  Rake::Task['unit'].invoke
end

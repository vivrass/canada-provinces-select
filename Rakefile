require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
 
begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "canada_provinces_select"
    s.summary = %Q{Canada Provinces select Rails plugin}
    s.homepage = "https://github.com/vivrass/canada-provinces-select"
    s.description = "Canada Provinces select Rails plugin"
    s.authors = ["PagerDuty"]
    
    s.add_runtime_dependency "rails", '>= 1.2'
    
    s.files.exclude 'init.rb'
    s.files.exclude 'canada_provinces_select.gemspec'
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end
 
require 'rake/testtask'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib' << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end
 
begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |t|
    t.libs << 'test'
    t.test_files = FileList['test/**/*_test.rb']
    t.verbose = true
  end
rescue LoadError
  puts "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
end
 
task :default => :test

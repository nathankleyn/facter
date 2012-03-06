# Rakefile for facter

$:.unshift File.expand_path('lib')
$LOAD_PATH << File.join(File.dirname(__FILE__), 'tasks')

require 'rubygems'
require 'rspec'
require 'rspec/core/rake_task'
begin
  require 'rcov'
rescue LoadError
  nil
end

Dir['tasks/**/*.rake'].each { |t| load t }

require 'rake'
require 'rake/packagetask'
require 'rake/gempackagetask'

load 'facter.gemspec'

Rake::PackageTask.new("facter", Facter::FACTERVERSION) do |pkg|
  pkg.package_dir = 'pkg'
  pkg.need_tar_gz = true
  pkg.package_files = GEM_FILES.to_a
end

Rake::GemPackageTask.new(GEM_SPEC) do |pkg|
end

task :default do
  sh %{rake -T}
end

# Aliases for spec
task :test    => [:spec]
task :tests   => [:spec]
task :specs   => [:spec]

RSpec::Core::RakeTask.new do |t|
  t.pattern ='spec/{unit,integration}/**/*_spec.rb'
  t.fail_on_error = true
end

RSpec::Core::RakeTask.new('spec:rcov') do |t|
  t.pattern ='spec/{unit,integration}/**/*_spec.rb'
  t.fail_on_error = true
  if defined?(Rcov)
    t.rcov = true
    t.rcov_opts = ['--exclude', 'spec/*,test/*,results/*,/usr/lib/*,/usr/local/lib/*,gems/*']
  end
end

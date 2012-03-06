$:.unshift File.expand_path('lib')

module Facter
  FACTERVERSION = File.read('lib/facter.rb')[/FACTERVERSION *= *'(.*)'/,1] or fail "Couldn't find FACTERVERSION"
end

GEM_FILES = FileList[
  '[A-Z]*',
  'install.rb',
  'bin/**/*',
  'lib/**/*',
  'conf/**/*',
  'etc/**/*',
  'spec/**/*'
]

GEM_SPEC = Gem::Specification.new do |spec|
  spec.platform = Gem::Platform::RUBY
  spec.name = 'facter'
  spec.files = GEM_FILES.to_a
  spec.executables = %w{facter}
  spec.version = Facter::FACTERVERSION
  spec.summary = 'Facter, a system inventory tool'
  spec.description = 'You can prove anything with facts!'
  spec.author = 'Puppet Labs'
  spec.email = 'info@puppetlabs.com'
  spec.homepage = 'http://puppetlabs.com'
  spec.rubyforge_project = 'facter'
  spec.has_rdoc = true
  spec.rdoc_options <<
    '--title' <<  'Facter - System Inventory Tool' <<
    '--main' << 'README' <<
    '--line-numbers'
end

# frozen_string_literal: true

require_relative 'lib/dynamic_time_zone/version'

Gem::Specification.new do |spec|
  spec.name          = 'dynamic_time_zone'
  spec.version       = DynamicTimeZone::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.author        = 'AppFolio'
  spec.email         = 'opensource@appfolio.com'
  spec.description   = 'Dynamically set the offset from UTC from timezone identifier'
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/appfolio/dynamic_time_zone'
  spec.license       = 'MIT'
  spec.files         = Dir['**/*'].select { |f| f[%r{^(lib/|LICENSE.txt|.*gemspec)}] }
  spec.require_paths = ['lib']

  spec.required_ruby_version = Gem::Requirement.new('< 3.5')
  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.add_dependency('activesupport', ['>= 7', '< 8.1'])
  spec.add_dependency('railties', ['>= 7', '< 8.1'])
  spec.add_dependency('tzinfo', ['>= 2', '< 3'])
end

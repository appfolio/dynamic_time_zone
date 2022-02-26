# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dynamic_time_zone/version'

Gem::Specification.new do |spec|
  spec.name          = 'dynamic_time_zone'
  spec.version       = DynamicTimeZone::VERSION
  spec.authors       = ['Appfolio']

  spec.homepage      = 'https://github.com/appfolio/dynamic_time_zone'
  spec.summary       = 'Dynamically set the offset from UTC from timezone identifier'

  spec.files         = Dir['{lib}/**/*']
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '>= 6.1', '< 7.1'
  spec.add_dependency 'railties', '>= 6.1', '< 7.1'
  spec.add_dependency 'tzinfo', '~> 2.0'
end

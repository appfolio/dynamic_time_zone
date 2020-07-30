# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dynamic_time_zone/version'

Gem::Specification.new do |spec|
  spec.name          = 'dynamic_time_zone'
  spec.version       = DynamicTimeZone::VERSION
  spec.authors       = ['Appfolio']

  spec.summary       = 'Dynamically set the offset from UTC from timezone identifier'

  spec.files         = Dir['{lib}/**/*']
  spec.require_paths = ['lib']

  spec.add_dependency 'tzinfo', '~> 1.2'
  spec.add_dependency 'activesupport', '>= 5.2', '< 7'
end

# frozen_string_literal: true

require 'time'
require 'active_support/core_ext/date_time/conversions'
require 'active_support/time_with_zone'
require 'active_support/core_ext/time/zones'
require 'active_support/core_ext/numeric/time'
require 'tzinfo'

module DynamicTimeZone
  class << self
    attr_accessor :enabled
  end

  REGEX_PATTERN = %r{DynamicTimeZone\/(\+|-)(\d+)}.freeze
end

DynamicTimeZone.enabled = false

require 'dynamic_time_zone/validator'
require 'dynamic_time_zone/identifier_builder'
require 'dynamic_time_zone/time_zone_data_source'
require 'dynamic_time_zone/localtime_patch'
require 'dynamic_time_zone/offset_format_convertor'
require 'dynamic_time_zone/time_parser'

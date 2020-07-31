# frozen_string_literal: true

require 'time'
require 'active_support/core_ext/date_time/conversions'
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

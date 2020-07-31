# frozen_string_literal: true

module DynamicTimeZone
  class << self
    attr_accessor :enabled
  end

  REGEX_PATTERN = %r{DynamicTimeZone\/(\+|-)(\d+)}.freeze
end

DynamicTimeZone.enabled = false

require 'dynamic_time_zone/validator'

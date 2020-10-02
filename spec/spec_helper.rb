# frozen_string_literal: true

require 'dynamic_time_zone'
require 'dynamic_time_zone/test_helper'
DynamicTimeZone.enabled = false

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  config.include(DynamicTimeZone::TestHelper)
end

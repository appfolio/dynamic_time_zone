# frozen_string_literal: true

module DynamicTimeZone
  module TestHelper
    def with_isolated_time_zone_and_dynamic_time_zone_setting
      old_time_zone = Time.zone
      old_enabled = DynamicTimeZone.enabled
      old_data_source = TZInfo::DataSource.get

      TZInfo::DataSource.set(DynamicTimeZone::TimeZoneDataSource.new)
      DynamicTimeZone.enabled = true

      yield
    ensure
      Time.zone = old_time_zone
      DynamicTimeZone.enabled = old_enabled
      TZInfo::DataSource.set(old_data_source)
    end
  end
end

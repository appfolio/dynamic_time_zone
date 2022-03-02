# frozen_string_literal: true

require 'spec_helper'

describe TimeWithZonePatch do
  before do
    TZInfo::DataSource.set(DynamicTimeZone::TimeZoneDataSource.new)
  end

  low_positive_offset_timezone = 'DynamicTimeZone/+36000'
  high_positive_offset_timezone = 'DynamicTimeZone/+3600000'
  low_negative_offset_timezone = 'DynamicTimeZone/-36000'
  high_negative_offset_timezone = 'DynamicTimeZone/-3600000'
  normal_offset_timezone = 'America/Los_Angeles'
  dynamic_timezones = [
    low_positive_offset_timezone,
    high_positive_offset_timezone,
    low_negative_offset_timezone,
    high_negative_offset_timezone
  ]

  let(:strftime_now) { Time.zone.now.strftime('%Y-%m-%d %H:%M:%S') }
  let(:now_default_to_s) { Time.zone.now.to_s(:default) }

  describe 'DynamicTimeZone is enabled' do
    around do |example|
      with_isolated_time_zone_and_dynamic_time_zone_setting do
        example.run
      end
    end

    dynamic_timezones.each do |timezone|
      it "strftime does not raise error with timezone #{timezone}" do
        Time.zone = timezone
        expect { strftime_now }.not_to raise_error
      end
    end

    [high_negative_offset_timezone, high_positive_offset_timezone].each do |timezone|
      it "default to_s ends with +0000 with timezone #{timezone}" do
        Time.zone = timezone
        expect(now_default_to_s).to end_with('+0000')
      end
    end

    [low_negative_offset_timezone, low_positive_offset_timezone].each do |timezone|
      it "to_s does not end with +0000 with timezone #{timezone}" do
        Time.zone = timezone
        expect(now_default_to_s).not_to end_with('+0000')
      end
    end

    it "default to_s ends with -1000 with timezone #{low_negative_offset_timezone}" do
      Time.zone = low_negative_offset_timezone
      expect(now_default_to_s).to end_with('-1000')
    end

    it "default to_s ends with +1000 with timezone #{low_positive_offset_timezone}" do
      Time.zone = low_positive_offset_timezone
      expect(now_default_to_s).to end_with('+1000')
    end

    it "to_s does not end with +0000 with timezone #{normal_offset_timezone}" do
      Time.zone = normal_offset_timezone
      expect(now_default_to_s).not_to end_with('+0000')
    end
  end

  describe 'DynamicTimeZone is disabled' do
    before do
      DynamicTimeZone.enabled = false
    end

    it "strftime does not raise error with timezone #{low_positive_offset_timezone}" do
      Time.zone = low_positive_offset_timezone
      expect { strftime_now }.not_to raise_error
    end

    it "default to_s ends with +1000 with timezone #{low_positive_offset_timezone}" do
      Time.zone = low_positive_offset_timezone
      expect(now_default_to_s).to end_with('+1000')
    end

    it "strftime raise error with timezone #{high_positive_offset_timezone}" do
      Time.zone = high_positive_offset_timezone
      expect { strftime_now }.to raise_error(ArgumentError)
    end
  end
end

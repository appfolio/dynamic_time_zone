# frozen_string_literal: true

require 'spec_helper'

describe TimeWithZonePatch do
  before do
    TZInfo::DataSource.set(DynamicTimeZone::TimeZoneDataSource.new)
  end

  describe 'DynamicTimeZone is enabled' do
    around do |example|
      with_isolated_time_zone_and_dynamic_time_zone_setting do
        example.run
      end
    end

    it 'works with low amount of offset' do
      Time.zone = 'DynamicTimeZone/+36000'
      expect { Time.zone.now.strftime('%Y-%m-%d %H:%M:%S') }.not_to raise_error
    end

    it 'works with high amount of offset' do
      Time.zone = 'DynamicTimeZone/+3600000'
      expect { Time.zone.now.strftime('%Y-%m-%d %H:%M:%S') }.not_to raise_error
    end
  end

  describe 'DynamicTimeZone is disabled' do
    before do
      DynamicTimeZone.enabled = false
    end

    it 'works with low amount of offset' do
      Time.zone = 'US/Arizona'
      expect { Time.zone.now.strftime('%Y-%m-%d %H:%M:%S') }.not_to raise_error
    end
  end
end
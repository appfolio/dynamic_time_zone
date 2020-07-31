# frozen_string_literal: true

require 'spec_helper'

describe LocaltimePatch do
  before do
    TZInfo::DataSource.set(DynamicTimeZone::TimeZoneDataSource.new)
  end

  describe 'DynamicTimeZone is enabled' do
    before do
      DynamicTimeZone.enabled = true
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

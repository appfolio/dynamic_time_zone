# frozen_string_literal: true

require 'spec_helper'

describe DynamicTimeZone::TimeZoneDataSource do
  before do
    TZInfo::DataSource.set(DynamicTimeZone::TimeZoneDataSource.new)
  end

  around do |example|
    with_isolated_time_zone_and_dynamic_time_zone_setting do
      example.run
    end
  end

  it 'can handle non dynamic timezone' do
    time_zone = TZInfo::Timezone.get('US/Arizona')
    expect(time_zone.identifier).to eq 'US/Arizona'
    utc_offset = time_zone.period_for_utc(DateTime.now).utc_offset
    expect(utc_offset).to eq -25200
  end

  it 'we can look up timezone by string' do
    time_zone = TZInfo::Timezone.get('DynamicTimeZone/+36000')
    expect(time_zone.identifier).to eq 'DynamicTimeZone/+36000'
    utc_offset = time_zone.period_for_utc(DateTime.now).utc_offset
    expect(utc_offset).to eq 36000
  end
end

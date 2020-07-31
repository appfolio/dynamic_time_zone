# frozen_string_literal: true

require 'spec_helper'

describe DynamicTimeZone::TimeZoneDataSource do
  before do
    TZInfo::DataSource.set(DynamicTimeZone::TimeZoneDataSource.new)
  end

  it 'can handle non dynamic timezone' do
    DynamicTimeZone.enabled = true
    time_zone = TZInfo::Timezone.get('US/Arizona')
    expect(time_zone.identifier).to eq 'US/Arizona'
    utc_offset = time_zone.period_for_utc(DateTime.now).utc_offset
    expect(utc_offset).to eq -25200
  end

  it 'we can look up timezone by string' do
    DynamicTimeZone.enabled = true
    time_zone = TZInfo::Timezone.get('DynamicTimeZone/+36000')
    expect(time_zone.identifier).to eq 'DynamicTimeZone/+36000'
    utc_offset = time_zone.period_for_utc(DateTime.now).utc_offset
    expect(utc_offset).to eq 36000
  end
end

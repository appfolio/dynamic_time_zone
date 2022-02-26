# frozen_string_literal: true

require 'spec_helper'

describe TimePatch do
  before do
    TZInfo::DataSource.set(DynamicTimeZone::TimeZoneDataSource.new)
  end

  let(:utc_time1) { Time.utc(2022, 1, 1, 0) }
  let(:utc_time2) { Time.utc(2022, 1, 2, 0) }
  let(:normal_zone_time3) do
    ActiveSupport::TimeWithZone.new(
      Time.utc(2022, 1, 3, 0),
      ActiveSupport::TimeZone['America/Los_Angeles']
    )
  end
  let(:normal_zone_time4) do
    ActiveSupport::TimeWithZone.new(
      Time.utc(2022, 1, 4, 0),
      ActiveSupport::TimeZone['America/New_York']
    )
  end

  describe 'DynamicTimeZone is enabled' do
    around do |example|
      with_isolated_time_zone_and_dynamic_time_zone_setting do
        example.run
      end
    end

    let(:dynamic_time5) do
      ActiveSupport::TimeWithZone.new(
        Time.utc(2022, 1, 5, 0),
        ActiveSupport::TimeZone['DynamicTimeZone/+3600000']
      )
    end

    let(:dynamic_time6) do
      ActiveSupport::TimeWithZone.new(
        Time.utc(2022, 1, 6, 0),
        ActiveSupport::TimeZone['DynamicTimeZone/-3600000']
      )
    end

    shared_examples 'sort normal times and dynamic times correctly' do
      it 'compare times correctly' do
        sorted_time = [utc_time1, utc_time2, normal_zone_time3, normal_zone_time4, dynamic_time5, dynamic_time6]
        expect(sorted_time.sort).to eql(sorted_time)
      end
    end

    describe 'when preserve_timezone is true' do
      before { DateAndTime::Compatibility.preserve_timezone = true }
      it_behaves_like 'sort normal times and dynamic times correctly'
    end

    describe 'when preserve_timezone is false' do
      before { DateAndTime::Compatibility.preserve_timezone = false }
      it_behaves_like 'sort normal times and dynamic times correctly'
    end
  end

  describe 'DynamicTimeZone is disabled' do
    before do
      DynamicTimeZone.enabled = false
    end

    shared_examples 'sort normal times correctly' do
      it 'compare times correctly' do
        sorted_time = [utc_time1, utc_time2, normal_zone_time3, normal_zone_time4]
        expect(sorted_time.sort).to eql(sorted_time)
      end
    end

    describe 'when preserve_timezone is true' do
      before { DateAndTime::Compatibility.preserve_timezone = true }
      it_behaves_like 'sort normal times correctly'
    end

    describe 'when preserve_timezone is false' do
      before { DateAndTime::Compatibility.preserve_timezone = false }
      it_behaves_like 'sort normal times correctly'
    end
  end
end

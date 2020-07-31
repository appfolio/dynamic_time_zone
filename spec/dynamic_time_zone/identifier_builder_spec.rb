# frozen_string_literal: true

require 'spec_helper'

describe DynamicTimeZone::IdentifierBuilder do
  let :base_datetime do
    DateTime.new(2020, 8, 1, 13, 12, 11)
  end

  before do
    allow(DateTime).to receive(:now).and_return(base_datetime)
  end

  describe 'from_target_datetime' do
    def build(year: 2020, month: 8, day: 1, hour: 13)
      described_class.new.from_target_datetime(year: year, month: month, day: day, hour: hour)
    end

    it 'gives 0 for same date time' do
      expect(build).to eq 'DynamicTimeZone/+0'
    end

    it 'gives 3_600 for changing by 1 hour forward' do
      expect(build(hour: 14)).to eq 'DynamicTimeZone/+3600'
    end

    it 'gives -3_600 for changing by 1 hour backward' do
      expect(build(hour: 12)).to eq 'DynamicTimeZone/-3600'
    end

    it 'gives 86_400 for changing by 1 day forward' do
      expect(build(day: 2)).to eq 'DynamicTimeZone/+86400'
    end

    it 'gives 2_678_400 for changing by 1 month forward' do
      expect(build(month: 9)).to eq 'DynamicTimeZone/+2678400'
    end
  end
end

# frozen_string_literal: true

require 'spec_helper'

describe DynamicTimeZone::TimeParser do
  subject(:parser) { described_class.new }

  it 'can parse strings that do not have time zone' do
    expect(parser.parse('2020/09/07 12:45:32')).to eq(DateTime.civil(2020, 9, 7, 12, 45, 32))
    expect(parser.parse('2020/09/07 2:45 PM')).to eq(DateTime.civil(2020, 9, 7, 14, 45, 00))
    expect(parser.parse('2020-09-07 2:45 PM')).to eq(DateTime.civil(2020, 9, 7, 14, 45, 00))
  end

  describe 'parse strings that have time zone' do
    include DynamicTimeZone::TestHelper

    around do |example|
      with_isolated_time_zone_and_dynamic_time_zone_setting do
        Time.zone = 'UTC'
        example.run
      end
    end

    it 'small offset' do
      expect(parser.parse('2020/09/07 12:45:32 +0100')).to eq(DateTime.civil(2020, 9, 7, 11, 45, 32))
      expect(parser.parse('2020/09/07 12:45:32 -0730')).to eq(DateTime.civil(2020, 9, 7, 20, 15, 32))
    end

    it 'large offset' do
      expect(parser.parse('2020/09/07 12:45:32 +10000')).to eq(DateTime.civil(2020, 9, 3, 8, 45, 32))
      expect(parser.parse('2020/09/07 12:45:32 -5030')).to eq(DateTime.civil(2020, 9, 9, 15, 15, 32))
    end
  end
end

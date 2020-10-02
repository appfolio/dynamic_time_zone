# frozen_string_literal: true

require 'spec_helper'

describe DynamicTimeZone::OffsetFormatConvertor do
  subject(:convertor) { described_class.new }

  it 'from_hour_minutes converts from hour minutes to seconds' do
    expect(convertor.from_hour_minutes(1000)).to eq(36000)
    expect(convertor.from_hour_minutes(10000)).to eq(360000)
    expect(convertor.from_hour_minutes(30)).to eq(1800)
  end
end

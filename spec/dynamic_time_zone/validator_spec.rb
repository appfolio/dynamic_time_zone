# frozen_string_literal: true

require 'spec_helper'

describe DynamicTimeZone::Validator do
  let(:invalid_input1){ 'DynamicTimeYone/+2000' }
  let(:invalid_input2){ 'DynamicTimeZone/@2000' }
  let(:valid_input){ 'DynamicTimeZone/+2000' }
  let(:unrelated_input){ 'America/Los_Angeles' }

  it 'returns false if the module is not enabled' do
    expect(described_class.new.valid?(valid_input)).to be false
  end

  it 'returns false if the input is unrelated' do
    expect(described_class.new.valid?(unrelated_input)).to be false
    with_isolated_time_zone_and_dynamic_time_zone_setting do
      expect(described_class.new.valid?(unrelated_input)).to be false
    end
  end

  it 'returns false if the module is enabled and input is invalid' do
    with_isolated_time_zone_and_dynamic_time_zone_setting do
      expect(described_class.new.valid?(invalid_input1)).to be false
      expect(described_class.new.valid?(invalid_input2)).to be false
    end
  end

  it 'returns true if the module is enabled and input is valid' do
    with_isolated_time_zone_and_dynamic_time_zone_setting do
      expect(described_class.new.valid?(valid_input)).to be true
    end
  end
end

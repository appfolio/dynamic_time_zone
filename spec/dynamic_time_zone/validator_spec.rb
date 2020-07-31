# frozen_string_literal: true

require 'spec_helper'

describe DynamicTimeZone::Validator do
  let(:invalid_input1){ 'DynamicTimeYone/+2000' }
  let(:invalid_input2){ 'DynamicTimeZone/@2000' }
  let(:valid_input){ 'DynamicTimeZone/+2000' }

  it 'returns false if the module is not enabled' do
    DynamicTimeZone.enabled = false
    expect(described_class.new.valid?(valid_input)).to be false
  end

  it 'returns false if the module is enabled and input is invalid' do
    DynamicTimeZone.enabled = true
    expect(described_class.new.valid?(invalid_input1)).to be false
    expect(described_class.new.valid?(invalid_input2)).to be false
  end

  it 'returns true if the module is enabled and input is valid' do
    DynamicTimeZone.enabled = true
    expect(described_class.new.valid?(valid_input)).to be true
  end
end

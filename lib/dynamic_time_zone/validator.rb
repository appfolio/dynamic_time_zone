# frozen_string_literal: true

module DynamicTimeZone
  class Validator
    def valid?(identifier)
      DynamicTimeZone.enabled && !identifier.scan(REGEX_PATTERN).last.nil?
    end
  end
end

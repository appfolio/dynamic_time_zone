# frozen_string_literal: true

module DynamicTimeZone
  class TimeZoneDataSource < TZInfo::ZoneinfoDataSource
    def load_timezone_info(identifier)
      return super unless DynamicTimeZone.enabled

      pattern_matches = identifier.scan(DynamicTimeZone::REGEX_PATTERN).last
      return super if pattern_matches.nil?

      sign, offset_amount = pattern_matches
      offset_amount = offset_amount.to_i
      offset_amount = 0 - offset_amount if sign == '-'

      timezone_info = TZInfo::TransitionDataTimezoneInfo.new(identifier)
      timezone_info.offset(identifier, offset_amount, 0, 'DynamicTimeZone')
      timezone_info
    end
  end
end

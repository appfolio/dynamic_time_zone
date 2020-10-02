# frozen_string_literal: true

module DynamicTimeZone
  class TimeParser
    def parse(time_string)
      raw_parts = time_string.split(' ')
      return DateTime.parse(time_string) unless raw_parts.length == 3 && (raw_parts.last.start_with?('+') || raw_parts.last.start_with?('-'))

      date_part = raw_parts[0]
      time_part = raw_parts[1]
      offset_part = raw_parts[2]
      offset_sign = offset_part[0]
      offset_amount_hour_minutes = offset_part[1..].to_i
      offset_seconds = DynamicTimeZone::OffsetFormatConvertor.new.from_hour_minutes(offset_amount_hour_minutes)

      ActiveSupport::TimeZone.new("DynamicTimeZone/#{offset_sign}#{offset_seconds}")
        .parse("#{date_part} #{time_part}")
    end
  end
end

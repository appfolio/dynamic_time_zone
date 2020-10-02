# frozen_string_literal: true

module DynamicTimeZone
  class OffsetFormatConvertor
    def from_hour_minutes(hour_minutes)
      hour = (hour_minutes / 100).floor
      minutes = (hour_minutes % 100)
      hour * 3600 + minutes * 60
    end
  end
end

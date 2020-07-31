# frozen_string_literal: true

module DynamicTimeZone
  class IdentifierBuilder
    def from_target_datetime(year:, month:, day:, hour:)
      now = DateTime.now.new_offset
      target = DateTime.new(year, month, day, hour, now.minute, now.second)
      offset = target.to_i - now.to_i
      'DynamicTimeZone/' + (offset.negative? ? '' : '+') + offset.to_s
    end
  end
end

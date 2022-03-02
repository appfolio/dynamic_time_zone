# frozen_string_literal: true

module TimeWithZonePatch
  def localtime(utc_offset = nil)
    return super unless using_dynamic_time_zone?

    utc + (utc_offset || 0).seconds
  end
  alias_method :getlocal, :localtime

  def formatted_offset(*args)
    actual_formatted_offset = super
    return actual_formatted_offset unless using_dynamic_time_zone?

    seconds_in_24_hours = 24 * 60 * 60
    utc_offset.abs > seconds_in_24_hours ?  '+0000' : actual_formatted_offset
  end

  def using_dynamic_time_zone?
    DynamicTimeZone::Validator.new.valid?(time_zone.name)
  end
end

ActiveSupport::TimeWithZone.prepend(TimeWithZonePatch)

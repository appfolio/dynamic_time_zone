# frozen_string_literal: true

module TimeWithZonePatch
  def localtime(utc_offset = nil)
    return super unless using_dynamic_time_zone?

    utc + (utc_offset || 0).seconds
  end
  alias_method :getlocal, :localtime

  def formatted_offset(*args)
    using_dynamic_time_zone? ? '+0000' : super
  end

  def using_dynamic_time_zone?
    DynamicTimeZone::Validator.new.valid?(time_zone.name)
  end
end

ActiveSupport::TimeWithZone.prepend(TimeWithZonePatch)

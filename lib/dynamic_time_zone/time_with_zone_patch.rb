# frozen_string_literal: true

module TimeWithZonePatch
  def localtime(utc_offset = nil)
    return super unless DynamicTimeZone.enabled

    utc + (utc_offset || 0).seconds
  end
  alias_method :getlocal, :localtime

  def formatted_offset(*args)
    DynamicTimeZone.enabled ? '+0000' : super
  end
end

ActiveSupport::TimeWithZone.prepend(TimeWithZonePatch)

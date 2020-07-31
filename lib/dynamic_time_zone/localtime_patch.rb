# frozen_string_literal: true

module LocaltimePatch
  def localtime(utc_offset = nil)
    return super unless DynamicTimeZone.enabled

    utc + (utc_offset || 0).seconds
  end
  alias_method :getlocal, :localtime
end

ActiveSupport::TimeWithZone.prepend(LocaltimePatch)

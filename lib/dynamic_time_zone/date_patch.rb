# frozen_string_literal: true

module DatePatch
  def current
    # Normally, Date.current ends up calling Time.zone.now which ends up passing the
    # dynamic zone offset to Time which can raises out of range error. Here, we attempt
    # to avoid that by grabbing the date out of time (which already works correctly with
    # dynaminc time zones).
    Time.current.to_date
  end
end

Date.singleton_class.prepend(DatePatch)

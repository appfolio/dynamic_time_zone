# frozen_string_literal: true

module TimePatch
  def compare_with_coercion(other)
    if DynamicTimeZone.enabled && other.is_a?(ActiveSupport::TimeWithZone) && other.using_dynamic_time_zone?
      self.utc <=> other.utc
    else
      super
    end
  end
  alias_method :<=>, :compare_with_coercion
end

Time.prepend(TimePatch)

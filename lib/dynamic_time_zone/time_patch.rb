# frozen_string_literal: true

module TimePatch
  def compare_with_coercion(other)
    return super if !DynamicTimeZone.enabled || (self.utc? && other.utc?)
    self.utc <=> other.utc
  end
  alias_method :<=>, :compare_with_coercion
end

Time.prepend(TimePatch)

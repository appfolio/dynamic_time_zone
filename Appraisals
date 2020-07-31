# frozen_string_literal: true

case RUBY_VERSION

when '2.6.3' then
  appraise "ruby-#{RUBY_VERSION}_rails52" do
    gem 'rails', '~> 5.2'
  end

  appraise "ruby-#{RUBY_VERSION}_rails60" do
    gem 'rails', '~> 6.0'
  end
else
  raise "Unsupported Ruby version #{RUBY_VERSION}"
end

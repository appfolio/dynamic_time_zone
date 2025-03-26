# frozen_string_literal: true

case RUBY_VERSION
when '3.2.5', '3.3.6', '3.4.1'
  appraise "ruby-#{RUBY_VERSION}_activesupport70_railties70" do
    source 'https://rubygems.org' do
      gem 'activesupport', '~> 7.0.0'
      gem 'railties', '~> 7.0.0'
    end
  end

  appraise "ruby-#{RUBY_VERSION}_activesupport71_railties71" do
    source 'https://rubygems.org' do
      gem 'activesupport', '~> 7.1.0'
      gem 'railties', '~> 7.1.0'
    end
  end

  appraise "ruby-#{RUBY_VERSION}_activesupport72_railties72" do
    source 'https://rubygems.org' do
      gem 'activesupport', '~> 7.2.0'
      gem 'railties', '~> 7.2.0'
    end
  end

  appraise "ruby-#{RUBY_VERSION}_activesupport80_railties80" do
    source 'https://rubygems.org' do
      gem 'activesupport', '~> 8.0.0'
      gem 'railties', '~> 8.0.0'
    end
  end
else
  raise "Unsupported Ruby version #{RUBY_VERSION}"
end

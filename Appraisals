# frozen_string_literal: true

if Gem::Requirement.new(['>= 3.3', '< 4.1']).satisfied_by?(Gem::Version.new(RUBY_VERSION))
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

  appraise "ruby-#{RUBY_VERSION}_activesupport80_railties81" do
    source 'https://rubygems.org' do
      gem 'activesupport', '~> 8.1.0'
      gem 'railties', '~> 8.1.0'
    end
  end
else
  raise "Unsupported Ruby version #{RUBY_VERSION}"
end

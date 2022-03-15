# frozen_string_literal: true

case RUBY_VERSION
when '2.6.9'
  rails_versions = ['~> 6.1.0']
when '2.7.5', '3.1.0'
  rails_versions = ['~> 6.1.0', '~> 7.0.0']
else
  raise "Unsupported Ruby version #{RUBY_VERSION}"
end

rails_versions.each do |rails_version|
  appraise "ruby-#{RUBY_VERSION}-rails#{rails_version.gsub(/[^\d]/,'')}" do
    source 'https://rubygems.org' do
      gem 'activesupport', rails_version
      gem 'railties', rails_version
    end
  end
end

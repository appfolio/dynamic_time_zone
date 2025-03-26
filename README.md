# DynamicTimeZone

Create a time zone that contains any offset from UTC. This gem assumes you use ActiveSupport

## Usage

Add this to your Gemfile

```ruby
gem 'dynamic_time_zone'
```

Enable the dynamic time zone

```ruby
DynamicTimeZone.enabled = true
```

Setup the time zone source

```ruby
TZInfo::DataSource.set(DynamicTimeZone::TimeZoneDataSource.new)
```

Use dynamic time zone

```ruby
Time.zone = 'DynamicTimeZone/+360000' # 100 hours ahead of UTC
Time.zone = 'DynamicTimeZone/-360000' # 100 hours behind UTC
```

To validate time zone string to match this format

```ruby
DynamicTimeZone::Validator.new.valid?('DynamicTimeZone/+360000') # valid
DynamicTimeZone::Validator.new.valid?('DynamicTimeZone/360000')  # invalid
```

## Development

To run test:

```bash
bundle exec rspec
```

To run test in all appraisals:

```bash
bundle exec appraisal install && bundle exec appraisal rspec
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

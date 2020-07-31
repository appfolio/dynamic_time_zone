# DynamicTimeZone

Create a time zone that contains any offset from UTC. This gem assumes you use ActiveSupport

## Usage

Add this to your Gemfile

```
gem 'dynamic_time_zone'
```

Enable the dynamic time zone

```
DynamicTimeZone.enabled = true
```

Setup the time zone source

```
TZInfo::DataSource.set(DynamicTimeZone::TimeZoneDataSource.new)
```

Use dynamic time zone

```
Time.zone = 'DynamicTimeZone/+360000' # 100 hours ahead of UTC
Time.zone = 'DynamicTimeZone/-360000' # 100 hours behind UTC
```

To validate time zone string to match this format

```
DynamicTimeZone::Validator.new.valid?('DynamicTimeZone/+360000') # valid
DynamicTimeZone::Validator.new.valid?('DynamicTimeZone/360000')  # invalid
```

## Development

To run test: `bundle exec rspec`

To run test in all appraisals: `bundle exec appraisal install && bundle exec appraisal rspec`




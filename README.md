# eatabit_rails

The official gem for the [eatabit.io](http://eatabit.io) API.

## Documentation
API documentation can be found [here](http://documentation.eatabit.io/v4).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eatabit_rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eatabit_rails

## Configure

Create an initializer like: config/initializers/eatabit.rb

```
EatabitRails.configure do |config|
  config.sid      = ENV.fetch('EATABIT_SID')
  config.token    = ENV.fetch('EATABIT_TOKEN')
  config.version  = 'v4'
end

```

## Create a Job

```
EatabitRails::Job.create(printer_id, job_data)
```

## Show a Job

```
EatabitRails::Job.find(printer_id, job_id)
```

## Show a Printer

```
EatabitRails::Printer(printer_id)
```

## Show an Account

```
EatabitRails::Account.find
```

## More Information

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/eatabit/eatabit_rails.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


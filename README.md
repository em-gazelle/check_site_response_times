# SiteResponseTimes

This gem provides a CLI to check average response times. Gem defaults to checking https://about.gitlab.com 6 
times with requests being spaced 10 seconds apart. You can specify the URL to make an HTTP GET request to, as well as the number of times to make the request and the number of seconds you'd like to wait between requests.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'site_response_times'
```
or:

```ruby
gem 'site_response_times', git: "git://github.com/em-gazelle/check_site_response_times.git"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install site_response_times

## Usage

	$ thor response_time:average

Optionally, you can provide an alternative url to check, as well as adjust the amount of time to wait between requests (default is 10 seconds) and the number of requests to make (default is 6).

	$ thor response_time:average url:your_url times_to_run:positive_integer seconds_between_requests:positive_integer

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/em-gazelle/site_response_times. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SiteResponseTimes project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/em-gazelle/site_response_times/blob/master/CODE_OF_CONDUCT.md).

# Reggie

Ruby DSL for working with regular expressions.

Instead of:
```ruby
/^[a-z0-9_-]{3,16}$/
```
Use this:
```ruby
Reggie.create do
  pattern UserName do
    min 3
    max 16
    match :letters, :numbers, :underscores, :hyphens
  end
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'reggie'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install reggie

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/reggie. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

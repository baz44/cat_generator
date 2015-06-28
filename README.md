# CatGenerator
CatGenerator generates random cat photos and facts about cat. It communicates with:
```
http://thecatapi.com/
http://catfacts-api.appspot.com/
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cat_generator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cat_generator

## Usage

To get the next cat photo url:
```ruby
CatGenerator::Photo.url
```

To open the next cat photo in a browser:
```ruby
CatGenerator::Photo.open_in_browser
```

To save the next cat photo on your desktop:
```ruby
CatGenerator::Photo.write_to_desktop
```

To get the next cat fact:
```ruby
CatGenerator::Fact.next
```

You can run the executable in terminal:
```bash
bundle exec cat_generator [browser|file|fact]
```

it will open the photo in browser by default if no option is given

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/cat_generator.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


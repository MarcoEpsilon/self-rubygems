# Imgdowner

This is a wrap interface for download image file from network

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'imgdowner'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install imgdowner

## Usage

```ruby
require 'imgdowner'

class Use
    include Imgdowner
    def initialize()
    end
    def todo()
        src = 'https://w.wallhaven.cc/full/r2/wallhaven-r2qqlj.jpg'
        self.download(src)
    end
end

use = Use.new
use.todo
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/imgdowner. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Imgdowner project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/imgdowner/blob/master/CODE_OF_CONDUCT.md).

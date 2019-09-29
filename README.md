# Avertasks

It's my gem, I write it to solve my problem about use multi-threads to download files from network..etc, which have common in handling many same work or task in multi-threads

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'avertasks'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install avertasks

## Usage
More detail you should look lib/*
```ruby
require 'avertasks'
def fibonacci(n)
    if (n == 1 || n == 2) then
        return 1
    else
        return fibonacci(n - 1) + fibonacci(n - 2)
    end
end
def main()
    taskmanager = TaskManager.new
    5.upto(35).each do |index|
        taskmanager.add_task(index) { puts fibonacci(index) }
    end
    # wait all tasks completed ...
    taskmanager.join
    puts "vertify tasks counts: #{TaskManager.run_times}"
end
main()
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/avertasks. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Avertasks project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/avertasks/blob/master/CODE_OF_CONDUCT.md).

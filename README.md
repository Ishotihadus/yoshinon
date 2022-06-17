# Yoshinon

Yoshinon is a gem to guard processes from signals such as SIGTERM and SIGINT.

The name comes from [Yoshino Yorita](https://project-imas.wiki/Yoshino_Yorita).

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add yoshinon

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install yoshinon

## Usage

```ruby
require 'yoshinon/sig/int'

Yoshinon.on_trap do
  puts 'Signal received!'
end

Yoshinon.lock do
  10.times do
    sleep 0.2
    puts 'running...'
  end
  puts 'end!'
end
```

```
$ bundle exec ruby test/sample.rb 
running...
running...
^CSignal received!
running...
running...
running...
running...
running...
running...
running...
running...
end!
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Ishotihadus/yoshinon.

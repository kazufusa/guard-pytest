# Guard::Pytest

Guard for [Pytest](http://pytest.org/latest/).

## Installation

Make sure you have installed pytest.

Add this line to your application's Gemfile:

    gem 'guard-pytest'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install guard-pytest

## Usage

```ruby
guard :pytest, tb: 'line', q: true do
  watch(%r{^((?!test/).*)\.py$})  {|m| "test/#{m[1]}_test.py" }
  watch(%r{^test/.*_test\.py$})
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/guard-pytest/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

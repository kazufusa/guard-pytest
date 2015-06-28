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
guard :pytest, pytest_option: "--doctest-modules --color=yes" do
  watch(%r{^((?!test/).*)\.py$})  {|m| "test/#{m[1]}_test.py" }
  watch(%r{^test/.*_test\.py$})
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kazufusa/guard-pytest. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


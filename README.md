## Multipluck

[![Build Status](https://travis-ci.org/jzaleski/multipluck.svg)](https://travis-ci.org/jzaleski/multipluck)
[![Dependency Status](https://gemnasium.com/jzaleski/multipluck.png)](https://gemnasium.com/jzaleski/multipluck)

A Ruby gem for Rails that enhances the `pluck` function to select multiple columns

## Usage

```ruby
# Fetch all user ids and names using var-args
User.pluck(:id, :name)
# => [[1, "Bob"], [2, "Simone"], ...]

# Fetch all user ids and names using an `Array` (legacy)
User.pluck([:id, :name])
# => [[1, "Bob"], [2, "Simone"], ...]
```

## Contributing

1. Fork it ( http://github.com/jzaleski/multipluck/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

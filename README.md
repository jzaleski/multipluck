## Multipluck  [![Build Status](https://secure.travis-ci.org/hanzq/multipluck.png)](http://travis-ci.org/hanzq/multipluck)

Multipluck is a Ruby gem for Rails that enhances the .pluck function to select multiple columns.  

Currently limited to Rails 3.2.3+, but I plan to change that.

### Usage

```ruby
# Fetch all user ids and names

User.pluck([:id, :name])
# => [ [1, "Bob"], [2, "Simone"], ...  ]
```

### Installation

 1. Add the gem to your Gemfile

 ```ruby
 gem 'multipluck'
 ```

 2. Pluck forth!


This project rocks and uses MIT-LICENSE. Yes it does.
Multipluck is a Ruby gem for rails that enhances the .pluck function to select multiple columns 

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
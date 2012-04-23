== Multipluck for Rails

pluck() multiple columns instead of just one!

    # Fetch all user ids and names
    User.pluck([:id, :name])

     => [ [1, "bob"], [2, "simone"], ...  ]

== Getting started

1. Add the gem to your Gemfile

    gem 'multipluck'

2. Pluck forth!

This project rocks and uses MIT-LICENSE. Yes it does.
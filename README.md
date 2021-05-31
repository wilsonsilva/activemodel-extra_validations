# Activemodel::ExtraValidations

[![Gem Version](https://badge.fury.io/rb/activemodel-extra_validations.svg)](https://badge.fury.io/rb/activemodel-extra_validations)
[![Build Status](https://travis-ci.org/wilsonsilva/activemodel-extra_validations.svg?branch=master)](https://travis-ci.org/wilsonsilva/activemodel-extra_validations)
[![Maintainability](https://api.codeclimate.com/v1/badges/7afec90a09db3956b7dc/maintainability)](https://codeclimate.com/github/wilsonsilva/activemodel-extra_validations/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/7afec90a09db3956b7dc/test_coverage)](https://codeclimate.com/github/wilsonsilva/activemodel-extra_validations/test_coverage)
[![Security](https://hakiri.io/github/wilsonsilva/activemodel-extra_validations/master.svg)](https://hakiri.io/github/wilsonsilva/activemodel-extra_validations/master)
[![Inline docs](http://inch-ci.org/github/wilsonsilva/activemodel-extra_validations.svg?branch=master)](http://inch-ci.org/github/wilsonsilva/activemodel-extra_validations)

Common ActiveModel/ActiveRecord validations.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activemodel-extra_validations'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install activemodel-extra_validations

## Usage

### presence_of_at_least_one_of

Validates that at least one of the supplied attributes are given.

```ruby
require 'activemodel/extra_validations/presence_of_at_least_one_of'

class BillingDetails
  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveModel::Attributes

  attribute :credit_card
  attribute :debit_card

  validate_presence_of_at_least_one_of :credit_card, :debit_card
end

billing_details = BillingDetails.new
billing_details.valid?
billing_details.errors.full_messages # => [
#  'Debit card is missing. At least one of [:credit_card, :debit_card] must be present',
#  'Credit card is missing. At least one of [:credit_card, :debit_card] must be present'
# ]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies, configure git hooks and create support files.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

The health and maintainability of the codebase is ensured through a set of
Rake tasks to test, lint and audit the gem for security vulnerabilities and documentation:

```
rake bundle:audit          # Checks for vulnerable versions of gems
rake qa                    # Test, lint and perform security and documentation audits
rake rubocop               # Lint the codebase with RuboCop
rake rubocop:auto_correct  # Auto-correct RuboCop offenses
rake spec                  # Run RSpec code examples
rake verify_measurements   # Verify that yardstick coverage is at least 100%
rake yard                  # Generate YARD Documentation
rake yard:junk             # Check the junk in your YARD Documentation
rake yardstick_measure     # Measure docs in lib/**/*.rb with yardstick
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wilsonsilva/activemodel-extra_validations.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to
the [code of conduct](https://github.com/wilsonsilva/activemodel-extra_validations/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Activemodel::ExtraValidations project's codebases, issue trackers, chat rooms and mailing
lists is expected to follow the [code of conduct](https://github.com/wilsonsilva/activemodel-extra_validations/blob/master/CODE_OF_CONDUCT.md).

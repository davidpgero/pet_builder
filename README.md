# PetBuilder
[![Code Climate](https://codeclimate.com/github/davidpgero/pet_builder/badges/gpa.svg)](https://codeclimate.com/github/davidpgero/pet_builder)
[![Test Coverage](https://codeclimate.com/github/davidpgero/pet_builder/badges/coverage.svg)](https://codeclimate.com/github/davidpgero/pet_builder/coverage)
[![Issue Count](https://codeclimate.com/github/davidpgero/pet_builder/badges/issue_count.svg)](https://codeclimate.com/github/davidpgero/pet_builder)
[![Inline docs](http://inch-ci.org/github/davidpgero/pet_builder.svg?branch=master)](http://inch-ci.org/github/davidpgero/pet_builder)

Welcome! It is a pet project. My aim show some interesting stuff.

## Install
```bash
git clone https://github.com/davidpgero/pet_builder.git pet_builder
cd pet_builder
bundle install
```

## Usage
```bash
cd pet_builder
echo 'name,age,dog\nPeter,12,dog' > test.csv
echo 'name;age;dog\nPeter;12;dog' > test.ssv
bundle console
```

```ruby
PetBuilder.build('test.csv')
PetBuilder.build('test.ssv')
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


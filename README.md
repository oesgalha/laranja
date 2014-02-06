# Laranja
[![Build Status](https://travis-ci.org/oesgalha/laranja.png)](https://travis-ci.org/oesgalha/laranja)

Laranja is a ruby gem which generates random fake valid data.
It aims to help testing brazilian applications, since it generates specific data from the country.
You can use it in your automated tests or to populate development databases.

## Installation

Add this line to your application's Gemfile:

    gem 'laranja'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install laranja

## Usage

### Names

```ruby
require 'laranja'

Laranja::Name.name                        # Vitória Pereira

Laranja::Name.name(2)                     # Ígor Braga Santos => Name with 2 surnames

Laranja::Name.first_name                  # Raul

Laranja::Name.last_name                   # Moreira

Laranja::Name.strfname(3, true, true)     # Fabrício Santos Costa Reis Junior => Name with 3 surnames, suffix and first name

Laranja::Name.strfname(1, true, false)    # Albuquerque Neto => Name with 1 surname, suffix but without first name
```

### CPF

```ruby
require 'laranja'

Laranja::CPF                              # 23379020648

Laranja::CPF.formatted                    # 524.966.867-49

Laranja::CPF.cpf(:rj)                     # 29564858739 => Random CPF from Rio de Janeiro

Laranja::CPF.formatted(:BA)               # 101.182.995-90 => Random CPF from Bahia

Laranja::CPF.cpf('RS')                    # 73272882014 => Random CPF from Rio Grande do Sul

Laranja::CPF.cpf('sp')                    # 07537191859 => Random CPF from São Paulo
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

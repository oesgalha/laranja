# Laranja
[![Build Status](https://travis-ci.org/oesgalha/laranja.png)](https://travis-ci.org/oesgalha/laranja)
[![Code Climate](https://codeclimate.com/github/oesgalha/laranja.png)](https://codeclimate.com/github/oesgalha/laranja)
[![Coverage Status](https://coveralls.io/repos/oesgalha/laranja/badge.png)](https://coveralls.io/r/oesgalha/laranja)

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

Laranja::CPF                    # 23379020648

Laranja::CPF.formatted          # 524.966.867-49

Laranja::CPF.cpf(:rj)           # 29564858739 => Random CPF from Rio de Janeiro

Laranja::CPF.formatted(:BA)     # 101.182.995-90 => Random CPF from Bahia

Laranja::CPF.cpf('RS')          # 73272882014 => Random CPF from Rio Grande do Sul

Laranja::CPF.cpf('sp')          # 07537191859 => Random CPF from São Paulo
```

### Internet

```ruby
require 'laranja'

Laranja::Internet.email                             # elsionogueira@gmail.com

Laranja::Internet.strfemail('Vitória Pereira')      # vitria.pereira@yahoo.com

Laranja::Internet.username                          # marli.macedo

Laranja::Internet.strfusername('Ana Machado')       # anamachado

Laranja::Internet.strfusername('Joel Melo', ['-'])  # joel-melo => Username with one of the specified separators ( - )

Laranja::Internet.password                          # Pq9vD8VJzttr6vrB77hDCp2LVK8iSm1iUjezQuS9dlah0EUukfQDPLf5ad0e6WwsrI39

Laranja::Internet.password(2, 6)                    # COW => Password with a random number of charaters between 2 and 6 (the default is 8 and 128)
```

## Roadmap

- Jobs
- Gender
- Addresses
- Phones
- Dates
- RG
- Credit Cards
- Bank Accounts
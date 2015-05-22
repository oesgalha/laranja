# Laranja
[![Build Status](https://travis-ci.org/oesgalha/laranja.png)](https://travis-ci.org/oesgalha/laranja)
[![Code Climate](https://codeclimate.com/github/oesgalha/laranja.png)](https://codeclimate.com/github/oesgalha/laranja)
[![Test Coverage](https://codeclimate.com/github/oesgalha/laranja/badges/coverage.svg)](https://codeclimate.com/github/oesgalha/laranja/coverage)

> Os termos "laranja" e "testa de ferro" designam, na linguagem popular, a pessoa que intermedeia transações financeiras fraudulentas, emprestando seu nome, documentos ou conta bancária para ocultar a identidade de quem a contrata.

Laranja is a ruby gem which generates random fake valid data.
It was built to help testing brazilian apps, since it generated specific data from the country.
Now it's localized with the I18n gem, the gem has custom data and custom generators per locale.
You can use it in your automated tests or to populate development databases.

## Installation

Add this line to your application's Gemfile:

    gem 'laranja'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install laranja

## Usage

In order to use the Laranja's generators you need to require it and call load:
```ruby
require 'laranja'

Laranja.load('pt-BR') # If no locale is passed, will try to use I18n.locale
```

Now you can use your locale specific generators.

### Available Locales

- [pt-BR](https://github.com/oesgalha/laranja/wiki/pt-BR)

### TODO

- Add a CONTRIBUTING.md
- Finish stuff in pt-BR
- Start en?

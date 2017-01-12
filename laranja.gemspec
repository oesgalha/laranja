# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'laranja/version'

Gem::Specification.new do |spec|
  spec.name          = 'laranja'
  spec.version       = Laranja::VERSION
  spec.authors       = ['Oscar Esgalha']
  spec.email         = ['oscaresgalha@gmail.com']
  spec.description       = <<DESC
Laranja is a ruby gem which generates random fake valid data.
It was built to help testing brazilian apps, since it generated specific data from the country.
Now it's localized with the I18n gem, the gem has custom data and custom generators per locale.
You can use it in your automated tests or to populate development databases.
DESC
  spec.summary       = %q{Laranja is a ruby gem which generates random fake valid data.}
  spec.homepage      = 'https://github.com/oesgalha/laranja'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'i18n', '~> 0.7'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 10.4'
  spec.add_development_dependency 'minitest', '~> 5.6'
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'laranja/version'

Gem::Specification.new do |spec|
  spec.name          = 'laranja'
  spec.version       = Laranja::VERSION
  spec.authors       = ['Oscar Esgalha']
  spec.email         = ['oscaresgalha@gmail.com\n']
  spec.description   = %q{Grab some valid brazilian fake data. For testing.}
  spec.summary       = %q{Laranja will generate valid brazilian fake data, which can be used for automated testing or populating development databases.}
  spec.homepage      = 'https://github.com/oesgalha/laranja'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'safe_yaml'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pet_builder/version'

Gem::Specification.new do |spec|
  spec.name          = 'pet_builder'
  spec.version       = PetBuilder::VERSION
  spec.authors       = ['David Gerő']
  spec.email         = ['davidpgero@davidpgero.com']

  spec.summary       = 'A simple test project.'
  spec.description   = 'It is only for play.'
  spec.homepage      = "https://github.com/davidpgero/pet_builder"
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end

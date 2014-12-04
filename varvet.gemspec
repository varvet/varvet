# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'varvet/version'

Gem::Specification.new do |spec|
  spec.name          = "varvet"
  spec.version       = Varvet::VERSION
  spec.authors       = ["Jens Ljungblad"]
  spec.email         = ["jens.ljungblad@gmail.com"]
  spec.summary       = ""
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "capistrano", "~> 3.2.1"
  spec.add_dependency "capistrano-bundler", "~> 1.1.2"
  spec.add_dependency "capistrano-rails", "~> 1.1.1"
  spec.add_dependency "seedbank", "~> 0.3.0"
  spec.add_dependency "thor", "~> 0.19.1"
  spec.add_dependency "unicorn", "~> 4.8.3"
  spec.add_dependency "foreman", "~> 0.76.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end

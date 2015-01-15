$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "varvet/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |gem|
  gem.name          = "varvet"
  gem.version       = Varvet::VERSION
  gem.authors       = ["Varvet"]
  gem.email         = ["info@varvet.se"]
  gem.homepage      = ""
  gem.summary       = ""
  gem.description   = ""
  gem.license       = "MIT"

  gem.files         = `git ls-files -z`.split("\x0")
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "thor", "~> 0.19.1"
  gem.add_dependency "unicorn", "~> 4.8.3"
  gem.add_dependency "foreman", "~> 0.76.0"
  gem.add_dependency "rails", "~> 4.1.1"

  gem.add_development_dependency "bundler", "~> 1.7"
  gem.add_development_dependency "rake", "~> 10.0"
end

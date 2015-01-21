$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "varvet/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |gem|
  gem.name          = "varvet"
  gem.version       = Varvet::VERSION
  gem.authors       = ["Varvet"]
  gem.email         = ["info@varvet.se"]
  gem.homepage      = "https://github.com/varvet/varvet"
  gem.summary       = ""
  gem.description   = ""
  gem.license       = "MIT"

  gem.files         = `git ls-files -z`.split("\x0")
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "appsignal", "~> 0.11.2"
  gem.add_dependency "foreman", "~> 0.76.0"
  gem.add_dependency "pry-byebug", "~> 2.0.0"
  gem.add_dependency "pry-doc", "~> 0.6.0"
  gem.add_dependency "pry-rails", "~> 0.3.2"
  gem.add_dependency "pry-rescue", "~> 1.4.1"
  gem.add_dependency "pry-stack_explorer", "~> 0.4.9"
  gem.add_dependency "rails", "~> 4.1"
  gem.add_dependency "thor", "~> 0.19.1"
  gem.add_dependency "unicorn", "~> 4.8.3"

  gem.add_development_dependency "bundler", "~> 1.7"
  gem.add_development_dependency "rake", "~> 10.0"
end

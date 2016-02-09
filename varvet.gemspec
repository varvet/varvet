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

  # Production
  gem.add_dependency "appsignal", "~> 0.11.2"
  gem.add_dependency "dotenv", "~> 2.1.0"
  gem.add_dependency "foreman", "~> 0.78.0"
  gem.add_dependency "lograge", "~> 0.3.1"
  gem.add_dependency "pry-byebug", "~> 3.0.1"
  gem.add_dependency "pry-doc", "~> 0.6.0"
  gem.add_dependency "pry-rails", "~> 0.3.2"
  gem.add_dependency "rails", "~> 4.1"
  gem.add_dependency "thor", "~> 0.19.1"
  gem.add_dependency "unicorn", "~> 4.8.3"

  # Test
  gem.add_dependency "codeclimate-test-reporter", "~> 0.4.7"
  gem.add_dependency "m", "~> 1.3.4"
  gem.add_dependency "minitest-reporters", "~> 1.0.17"
  gem.add_dependency "minitest", "~> 5.7.0"

  # Development
  gem.add_dependency "better_errors", "~> 1.1.0"
  gem.add_dependency "binding_of_caller", "~> 0.7.2"
  gem.add_dependency "meta_request", "~> 0.3.4"

  # Test & Development
  gem.add_dependency "dotenv-rails", "~> 2.1.0"

  # All
  gem.add_development_dependency "bundler", "~> 1.7"
  gem.add_development_dependency "rake", "~> 10.0"
end

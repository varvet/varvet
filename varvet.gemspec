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
  gem.add_dependency "appsignal", "~> 2.0"
  gem.add_dependency "dotenv-rails", "~> 2.1.0"
  gem.add_dependency "foreman", "~> 0.78.0"
  gem.add_dependency "lograge", "~> 0.3.1"
  gem.add_dependency "thor", "~> 0.19.1"
  gem.add_dependency "unicorn", "~> 4.8.3"
end

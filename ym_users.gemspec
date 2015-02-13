$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ym_users/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ym_users"
  s.version     = YmUsers::VERSION
  s.authors     = ["Yoomee Developers"]
  s.email       = ["developers@yoomee.com"]
  s.summary     = "Summary of YmUsers."
  s.description = "Description of YmUsers."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "ym_core"
  s.add_dependency "devise", "~> 3.0"
  s.add_dependency "cancancan", "~> 1.8"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 2.0"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "cucumber-rails"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "webmock"

end
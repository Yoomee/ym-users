$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ym_users/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ym_users"
  s.version     = YmUsers::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of YmUsers."
  s.description = "TODO: Description of YmUsers."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.0"
  s.add_dependency 'devise'
  s.add_dependency 'cancan'

  s.add_development_dependency "sqlite3"
end

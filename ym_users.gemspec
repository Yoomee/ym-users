$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ym_users/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ym_users"
  s.version     = YmUsers::VERSION
  s.authors     = ["Matt Atkins", "Ian Mooney", "Si Wilkins", "Edward Andrews"]
  s.email       = ["matt@yoomee.com", "ian@yoomee.com", "si@yoomee.com", "edward@yoomee.com"]
  s.homepage    = "http://www.yoomee.com"
  s.summary     = "Summary of YmUsers."
  s.description = "Description of YmUsers."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.0"
  s.add_dependency 'ym_core', "~> 0.1"
  s.add_dependency 'devise', "~> 2.1.0"
  s.add_dependency 'cancan'

  # for testing
  s.add_development_dependency "mysql2"    
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"  
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency "capybara", '~> 1.1.0'
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "geminabox"
  s.add_development_dependency 'ym_tools', '~> 0.1.1'

end

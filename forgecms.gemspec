$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "forgecms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "forgecms"
  s.version     = Forgecms::VERSION
  s.authors     = ["Kyle Bedell"]
  s.email       = ["kyle@kylebedell.com"]
  s.homepage    = "kylebedell.com"
  s.summary     = "TODO: Summary of Forgecms."
  s.description = "TODO: Description of Forgecms."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5"

  s.add_development_dependency "mysql2"
end

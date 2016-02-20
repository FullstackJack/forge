$:.push File.expand_path("../lib", __FILE__)

version = File.read(File.expand_path('../FORGE_VERSION', __FILE__)).strip

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "forge"
  s.version     = version
  s.authors     = ["Kyle Bedell"]
  s.email       = ["kyle@kylebedell.com"]
  s.homepage    = "http://www.kylebedell.com"
  s.summary     = "A blogging platform."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'forge_api'
  
  s.add_dependency 'rails', '~> 4.2.4'
  s.add_dependency 'ember-cli-rails'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'

  # Require timezone info for Windows
  s.add_development_dependency 'tzinfo-data'
end

$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "forgecms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "forgecms"
  s.version     = Forgecms::VERSION
  s.authors     = ["Kyle Bedell"]
  s.email       = ["kyle@kylebedell.com"]
  s.homepage    = "http://www.kylebedell.com"
  s.summary     = "Create a CMS-backed blog or website."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '~> 4.2.4'
  s.add_dependency 'jquery-rails', '~> 4.0.5'
  s.add_dependency 'bootstrap-sass', '~> 3.3.6'
  s.add_dependency 'sass-rails', '>= 3.2'
  s.add_dependency 'sprockets-rails', '>= 2.1.4'
  s.add_dependency 'font-awesome-sass', '~> 4.5.0'
  s.add_dependency 'devise', '>= 3.5.2'
  s.add_dependency 'pundit', '~> 1.1.0'
  s.add_dependency 'haml-rails', '~> 0.9'
  s.add_dependency 'momentjs-rails', '>= 2.9.0'
  s.add_dependency 'react-rails', '~> 1.5.0'
  s.add_dependency 'bootstrap3-datetimepicker-rails', '~> 4.17.37'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'

  # Require MySQL adapter for testing
  s.add_development_dependency 'mysql2'

  # Require timezone info for Windows
  s.add_development_dependency 'tzinfo-data'
end

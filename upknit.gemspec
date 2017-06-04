$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "upknit/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "upknit"
  s.version     = Upknit::VERSION
  s.authors     = ["OZAWA Sakuro"]
  s.email       = ["sakuro@2238club.org"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Upknit."
  s.description = "TODO: Description of Upknit."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.1"

  s.add_development_dependency "pg"
end

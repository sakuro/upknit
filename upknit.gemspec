$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "upknit/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "upknit"
  s.version     = Upknit::VERSION
  s.authors     = ["OZAWA Sakuro"]
  s.email       = ["sakuro@2238club.org"]
  s.homepage    = "https://github.com/sakuro/upknit"
  s.summary     = "UUID primary key enabler for rails."
  s.description = <<~EOS
  This rails engine configures necessary settings to enable native UUID primary key
  in rails + postgresql environment.
  EOS
  s.license     = "MIT"

  s.required_ruby_version = '>= 2.5'

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1"

  s.add_development_dependency "pg", '~> 1.0'
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "yard"
  s.add_development_dependency "kramdown"
  s.add_development_dependency "rubocop", '~> 0.58.1'
  s.add_development_dependency "rubocop-rspec", '~> 1.27.0'
end

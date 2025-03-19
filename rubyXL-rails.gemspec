$:.push File.expand_path("../lib", __FILE__)

# Maintain gem's version:
require "rubyXL-rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rubyXL-rails"
  s.version     = RubyXL::Rails::VERSION 
  s.authors     = ["Santiago Ramos"]
  s.email       = ["santiago.ramos@oei.int"]
  s.homepage    = "https://github.com/sramos/rubyXL-rails"
  s.summary     = "Support for XLSX based views"
  s.description = "A gem to generate xlsx documents by using rxlsx templates."

  s.files = Dir["{lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 6.0"
  s.add_dependency "rubyXL", "~> 3.4.4"
end

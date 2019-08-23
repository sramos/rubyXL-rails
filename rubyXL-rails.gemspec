$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rubyXL-rails"
  s.version     = "0.1" 
  s.authors     = ["Santiago Ramos"]
  s.email       = ["sramos@oei.es"]
  s.homepage    = "https://github.com/sramos/rubyXL-rails"
  s.summary     = "Support for XLSX based views"
  s.description = "A gem to generate xlsx documents by using rxlsx templates."

  s.files = Dir["{lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 4.2"
  s.add_dependency "rubyXL", "~> 3.4.4"
end

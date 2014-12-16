$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "multipluck/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "multipluck"
  s.version     = Multipluck::VERSION
  s.authors     = ["David Wright"]
  s.email       = ["davidwright@gmail.com"]
  s.homepage    = "https://github.com/hanzq/multipluck"
  s.summary     = "Use the ActiveRecord pluck to pluck multiple columns instead of just one"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2.0", "< 4.0"

  s.add_development_dependency "sqlite3"
end

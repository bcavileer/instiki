$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "instiki/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "instiki"
  s.version     = Instiki::VERSION
  s.authors     = ["Benjamin Cavileer"]
  s.email       = ["bcavileer@gmail.com "]
  s.homepage    = ""
  s.summary     = "Instiki Rails Engine"
  s.description = "Instiki as a mountable Engine"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.11"
  s.add_dependency "sqlite3"
  s.add_dependency "itextomml", ">=1.4.10"
  s.add_dependency "rack", ">=1.1.3"
  s.add_dependency "mongrel", ">=1.2.0.pre2"
  s.add_dependency "rubyzip"
  s.add_dependency "RedCloth", ">=4.0.0"
  s.add_dependency "erubis"
  s.add_dependency "nokogiri"
  s.add_dependency "rake"
  s.add_dependency "rdoc"
  s.add_dependency "json"
  s.add_dependency "file_signature"
  s.add_dependency "maruku"
  s.add_dependency "rake"
end

# -*- encoding: utf-8 -*-
$:.push File.join(File.dirname(__FILE__), 'lib')
require "attached/version"

Gem::Specification.new do |s|
  s.name        = "attached"
  s.version     = Attached::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Kevin Sylvestre"]
  s.email       = ["kevin@ksylvest.com"]
  s.homepage    = "http://github.com/ksylvest/attached"
  s.summary     = "An attachment library designed with cloud processors in mind."
  s.description = "Attached is a Ruby on Rails cloud attachment and processor library inspired by Paperclip. Attached lets users push files to the cloud, then perform remote processing on the files."

  s.files       = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files  = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.0.rc1"

  s.add_development_dependency "sqlite3"
end

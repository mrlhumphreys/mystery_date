# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mystery_date/version"

Gem::Specification.new do |s|
  s.name        = "mystery_date"
  s.version     = MysteryDate::VERSION
  s.authors     = ["mrlhumphreys"]
  s.email       = ["mark@mrlhumphreys.com"]
  s.homepage    = ""
  s.summary     = %q{Allows you to easily define date methods where the day month or year is unknown.}
  s.description = %q{Allows you to easily define date methods where the day month or year is unknown.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "activemodel"
  # s.add_runtime_dependency "rest-client"
end

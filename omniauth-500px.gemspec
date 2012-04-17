# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-500px/version', __FILE__)

Gem::Specification.new do |g|
  g.authors       = ["Matthias Leitner"]
  g.email         = ["developer@smartcode.at"]
  g.description   = %q{OmniAuth strategy for 500px.com.}
  g.summary       = %q{OmniAuth strategy for 500px.com.}
  g.homepage      = "https://github.com/smartcode/omniauth-500px"

  g.version       = OmniAuth::Auth500px::VERSION
  g.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  g.files         = `git ls-files`.split("\n")
  g.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  g.name          = "omniauth-500px"
  g.require_paths = ["lib"]


  g.add_dependency 'omniauth', '~> 1.0'
  g.add_dependency 'omniauth-oauth2', '~> 1.0'
  g.add_development_dependency 'rspec', '~> 2.7'
  g.add_development_dependency 'rack-test'
  g.add_development_dependency 'simplecov'
  g.add_development_dependency 'webmock'
end

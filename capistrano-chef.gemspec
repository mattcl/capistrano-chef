# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/chef/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-chef"
  spec.version       = Capistrano::Chef::VERSION
  spec.authors       = ["Matt Chun-Lum\n"]
  spec.email         = ["mchunlum@gmail.com"]
  spec.summary       = %q{Chef search for capistrano}
  spec.description   = %q{Chef search for capistrano}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end

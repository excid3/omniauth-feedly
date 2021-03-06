# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-feedly/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-feedly"
  spec.version       = OmniAuth::Feedly::VERSION
  spec.authors       = ["John Potter"]
  spec.email         = ["johnpotter1440@gmail.com"]
  spec.summary       = %q{Unofficial OmniAuth strategy for Feedly}
  spec.homepage      = "https://github.com/johnmpotter/omniauth-feedly"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth', '~> 1.2.0'
  spec.add_dependency 'omniauth-oauth2', '~> 1.3.1'
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end

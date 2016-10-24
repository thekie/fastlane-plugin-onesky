# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/onesky/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-onesky'
  spec.version       = Fastlane::Onesky::VERSION
  spec.author        = %q{Daniel Kiedrowski}
  spec.email         = %q{daniel@levire.com}

  spec.summary       = %q{Helps to update the translations of your app using the OneSky service.}
  # spec.homepage      = "https://github.com/<GITHUB_USERNAME>/fastlane-plugin-onesky"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # spec.add_dependency 'your-dependency', '~> 1.0.0'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fastlane', '>= 1.105.3'
end

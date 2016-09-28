# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/sharethemeal/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-sharethemeal'
  spec.version       = Fastlane::Sharethemeal::VERSION
  spec.author        = %q{Helmut Januschka}
  spec.email         = %q{helmut@januschka.com}

  spec.summary       = %q{ShareTheMeal}
  # spec.homepage      = "https://github.com/<GITHUB_USERNAME>/fastlane-plugin-sharethemeal"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rest-client'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fastlane', '>= 1.104.0'
end

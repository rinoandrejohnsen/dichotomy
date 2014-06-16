# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dichotomy/version'

Gem::Specification.new do |spec|
  spec.name          = 'dichotomy'
  spec.version       = Dichotomy::VERSION
  spec.authors       = ['Rino André Johnsen']
  spec.email         = ['rinoandrejohnsen@gmail.com']
  spec.summary       = %q{Dichotomy is an Inversion of Control Container for Ruby applications.}
  spec.description   = %q{Dichotomy provides architectural plumbing that allows you to create and manage application components, and acts as the Application Composition layer.}
  spec.homepage      = 'https://github.com/rinoandrejohnsen/dichotomy'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 0.9'

  spec.add_runtime_dependency 'parser', '~> 2.1', '>= 2.1.9'

  spec.required_ruby_version = '~> 2.0'
end

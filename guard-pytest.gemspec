# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/pytest/version'

Gem::Specification.new do |spec|
  spec.name          = "guard-pytest"
  spec.version       = Guard::PytestVersion::VERSION
  spec.authors       = ["kazufusa"]
  spec.email         = ["kazu.jiyuunosenshi.fusa@gmail.com"]

  spec.summary       = 'Guard gem for Pytest'
  spec.description   = <<-DESC
    Guard::Pytest automatically runs Pytest when watched files are modified.
  DESC
  spec.homepage      = "https://github.com/kazufusa/guard-pytest"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'guard', '~> 2.12'
  spec.add_dependency 'guard-compat', '~> 1.2'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', "~> 3.0"
end

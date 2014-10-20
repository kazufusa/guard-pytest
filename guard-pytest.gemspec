# coding: utf-8
$:.push File.expand_path('../lib', __FILE__)
require 'guard/pytest/version'

Gem::Specification.new do |s|
  s.name          = "guard-pytest"
  s.version       = Guard::Pytest::VERSION
  s.authors       = ["kazufusa"]
  s.email         = ["kazu.jiyuunosenshi.fusa@gmail.com"]
  s.homepage      = "https://github.com/kazufusa/guard-pytest"
  s.summary       = 'Guard gem for Pytest'
  s.description   = <<-DESC
    Guard::Pytest automatically runs Pytest when watched files are modified.
  DESC
  s.license       = "MIT"

  s.files         = `git ls-files -z`.split("\x0")
  s.require_paths = ["lib"]

  s.add_dependency 'guard', '>= 1.1.0'
  s.add_development_dependency "bundler", "~> 1.6"
end

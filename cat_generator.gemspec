# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cat_generator/version'

Gem::Specification.new do |spec|
  spec.name          = "cat_generator"
  spec.version       = CatGenerator::VERSION
  spec.authors       = ["Basel Farah"]
  spec.email         = ["baself@gmail.com"]

  spec.summary       = %q{Generates cat photos and facts}
  spec.description   = %q{Use this gem to generate cat photos and cats, it interacts with http://thecatapi.com/ and http://catfacts-api.appspot.com/}
  spec.homepage      = "https://github.com/baz44/cat_generator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"

  spec.add_dependency 'excon'
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'statistical/version'

Gem::Specification.new do |spec|
  spec.name          = 'statistical'
  spec.version       = Statistical::VERSION
  spec.authors       = ['Vaibhav Yenamandra']
  spec.email         = ['yvvaibhav@gmail.com']

  spec.summary       = %q{Statistical distributions in ruby. }
  spec.description   = %q{Statistical distributions in ruby. This library aims to provide and enhance an API that maintains familiarity with rubys core and stdlib.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/})}
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f)}
  spec.extensions    = []
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry', '~> 0'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rubocop', '~> 0'
end

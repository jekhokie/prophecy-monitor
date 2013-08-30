# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prophecy-monitor/version'

Gem::Specification.new do |gem|
  gem.name          = "prophecy-monitor"
  gem.version       = Prophecy::Monitor::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = [ "Justin Karimi" ]
  gem.email         = [ "jekhokie@gmail.com" ]
  gem.description   = %q{API to monitor a Voxeo Prophecy instance}
  gem.summary       = %q{In an effort to track the current call status of different applications in a Voxeo Prophecy
                         instance, this project allows for interfacing with a Voxeo Prophecy instance in order to present
                         current call counts based on application ID mappings, along with other information exposed via
                         the Prophecy API.}
  gem.homepage      = "https://github.com/jekhokie/prophecy-monitor"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = [ "lib" ]

  gem.add_development_dependency "bundler", "~> 1.3"
end

# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'brot/version'

Gem::Specification.new do |s|
  s.name        = 'brot'
  s.version     = Brot::VERSION
  s.authors     = ['blindgaenger']
  s.email       = ['blindgaenger@gmail.com']
  s.homepage    = 'http://protonet.local'
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = 'brot'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  #s.add_development_dependency 'rspec'
  s.add_runtime_dependency 'protolink'
end

# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_template/version'

Gem::Specification.new do |gem|
  gem.name          = "ruby_template"
  gem.version       = RubyTemplate::VERSION
  gem.authors       = ["Scott Fleckenstein"]
  gem.email         = ["nullstyle@gmail.com"]
  gem.description   = %q{RubyTemplate gives you a simple means of producing json in your views by letting you write normal ruby. }
  gem.summary       = %q{Produce JSON views using pure-ruby}
  gem.homepage      = "https://github.com/nullstyle/ruby_template"
  gem.license       = 'MIT'
  
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency("actionpack", '>= 3.0.0')
  gem.add_dependency("activesupport", '>= 3.0.0')
end

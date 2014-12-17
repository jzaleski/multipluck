# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'multipluck/version'

Gem::Specification.new do |gem|
  gem.name = 'multipluck'
  gem.version = Multipluck::VERSION
  gem.authors = ['Jonathan W. Zaleski', 'David Wright']
  gem.email = ['JonathanZaleski@gmail.com']
  gem.homepage = 'https://github.com/jzaleski/multipluck'
  gem.summary = 'A Ruby gem for Rails that enhances the `pluck` function to select multiple columns'

  gem.files = `git ls-files`.split($/)
  gem.executables = gem.files.grep(%r{^bin/}) { |file| File.basename(file) }
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})

  gem.add_dependency 'rails', '>= 3.2.0', '< 4.0'
end

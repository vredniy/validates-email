# coding: utf-8
lib = File.expand_path('../lib', __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'validates-email/version'

Gem::Specification.new do |gem|
  gem.name = "validates-email"
  gem.homepage = "http://github.com/vredniy/validates-email"
  gem.license = "MIT"
  gem.summary = %Q{Adding validates_email functionality}
  gem.description = %Q{Some description for validates-gem}
  gem.email = "dnd.pliz@gmail.com"
  gem.authors = ["Dmitry Zudochkin"]
  gem.version       = ValidatesEmail::VERSION

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'rails', ['>= 3', '< 5']

  gem.add_development_dependency 'rspec-rails'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'sqlite3'
  gem.add_development_dependency 'pry'
end

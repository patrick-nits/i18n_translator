# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'i18n_translator/version'

Gem::Specification.new do |spec|
  spec.name          = "i18n_translator"
  spec.version       = I18nTranslator::VERSION
  spec.authors       = ["Patrick Nitschke"]
  spec.email         = ["patrick.nits@googlemail.com"]
  spec.summary       = %q{Generate I18n Translation Files}
  spec.description   = %q{Yes...}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'bing_translator', '~> 4.4.0'

  spec.add_dependency 'rails', '~> 4.0'
  spec.add_dependency 'i18n'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end

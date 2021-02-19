# frozen_string_literal: true

require_relative 'lib/activemodel/extra_validations/version'

Gem::Specification.new do |spec|
  spec.name        = 'activemodel-extra_validations'
  spec.version     = Activemodel::ExtraValidations::VERSION
  spec.authors     = ['Wilson Silva']
  spec.email       = ['me@wilsonsilva.net']

  spec.summary     = 'Common validations for ActiveModel'
  spec.description = 'Common validations for ActiveModel'
  spec.homepage    = 'https://github.com/wilsonsilva/activemodel-extra_validations'
  spec.license     = 'MIT'

  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/wilsonsilva/activemodel-extra_validations'
  spec.metadata['changelog_uri'] = 'https://github.com/wilsonsilva/activemodel-extra_validations/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler-audit', '~> 0.7'
  spec.add_development_dependency 'guard', '~> 2.16'
  spec.add_development_dependency 'guard-bundler', '~> 3.0'
  spec.add_development_dependency 'guard-bundler-audit', '~> 0.1.4'
  spec.add_development_dependency 'guard-rspec', '~> 4.7'
  spec.add_development_dependency 'guard-rubocop', '~> 1.4'
  spec.add_development_dependency 'overcommit', '~> 0.57.0'
  spec.add_development_dependency 'pry', '~> 0.14'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.93'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.44'
  spec.add_development_dependency 'simplecov', '~> 0.17.1'
  spec.add_development_dependency 'simplecov-console', '~> 0.9'
end

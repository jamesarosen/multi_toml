Gem::Specification.new do |gem|
  gem.version = '1.0.0'
  gem.name = 'multi_toml'
  gem.files = Dir["lib/**/*", "config/**/*"] + %w(README.md LICENSE)
  gem.summary = %q{A gem to provide swappable TOML backends.}
  gem.description = %q{A gem to provide easy switching between different TOML backends, including toml, toml-ruby, and toml2.}
  gem.email = "james.a.rosen@gmail.com"
  gem.homepage = "http://github.com/jamesarosen/multi_toml"
  gem.authors = ["James A. Rosen"]
  gem.test_files = Dir["spec/**/*_spec.rb"]
  gem.require_paths = ["lib"]
  gem.has_rdoc = 'false'
  gem.specification_version = 2
  gem.add_development_dependency 'rake',  '~> 10.0'
  gem.add_development_dependency 'rspec', '~> 2.11'
end

# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-widgets'
  s.version           = '0.1'
  s.description       = 'Ruby on Rails Widgets extension for Refinery CMS'
  s.date              = '2013-02-22'
  s.summary           = 'Widgets extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]
  s.authors           = ['Chris Reister (chrisftw)']

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '>= 2.0.0'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.9'
end

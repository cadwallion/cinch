Gem::Specification.new do |s|
  s.name = 'cinch'
  s.version = '1.1.1'
  s.summary = 'An IRC Bot Building Framework'
  s.description = 'A simple, friendly DSL for creating IRC bots'
  s.authors = ['Lee Jarvis', 'Dominik Honnef']
  s.email = ['lee@jarvis.co', 'dominikh@fork-bomb.org']
  s.homepage = 'http://rubydoc.info/github/cinchrb/cinch'
  s.required_ruby_version = '>= 1.9.1'
  s.files = Dir['LICENSE', 'README.md', '{test,lib,examples}/**/*']
  s.add_development_dependency('riot', '= 0.12.0')
end

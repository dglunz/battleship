Gem::Specification.new do |s|
  s.name          = 'battleship-dglunz'
  s.version       = '1.0.1'
  s.date          = '2014-08-24'
  s.summary       = "Mastermind in your terminal!"
  s.description   = "Classic Mastermind Game a la Ruby"
  s.authors       = ["Danny Glunz"]
  s.email         = 'dannyglunz@gmail.com'
  s.files         = %w[battleship-dglunz.gemspec
                       README.md
                       bin/battleship
                       lib/battleship-dglunz/board.rb
                       lib/battleship-dglunz/cli.rb
                       lib/battleship-dglunz/color_sequence.rb
                       lib/battleship-dglunz/display.rb
                       lib/battleship-dglunz/game.rb]
  s.require_paths = ['lib/battleship-dglunz/']
  s.homepage      = 'http://rubygems.org/gems/battleship-dglunz'
  s.license       = 'MIT'
  s.executables   = 'battleship'

  s.add_runtime_dependency 'terminal-table', '~> 1.4.5', '>= 1.4.5'
  s.add_runtime_dependency 'rainbow', '~> 2.0.0', '>= 2.0.0'
end

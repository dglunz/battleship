require_relative 'test_helper'

class GameTest < Minitest::Test
  def test_validate_attack
    skip
    
    player_1 = Player.new("Dan", Fleet.new)
    player_2 = Player.new("Stan", Fleet.new)
    stdin = StringIO.new
    stdout = StringIO.new
    game = Game.new(Display.new(stdout), player_1, player_2, Check, stdin)
    game.get_input
    game.valid_attack_input

  end
end

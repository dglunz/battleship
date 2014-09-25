require_relative 'test_helper'

class GameTest < Minitest::Test
  def test_validate_attack
    player_1 = Player.new("Dan", Fleet.new)
    player_2 = Player.new("Stan", Fleet.new)
    game = Game.new(Display, player_1, player_2, Check)
    
    game.valid_attack_input

  end
end

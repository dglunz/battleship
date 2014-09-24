require_relative 'test_helper'
require './lib/game'

class GameTest < Minitest::Test
  def test_round_count
    skip
    battleship = Game.new
    assert_equal 0, battleship.count

    battleship.play_round
    assert_equal 1, battleship.count

    battleship.play_round
    assert_equal 2, battleship.count
  end

  def test_introduction
    battleship = Game.new

  end
end

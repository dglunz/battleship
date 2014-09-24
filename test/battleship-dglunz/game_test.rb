require_relative 'test_helper'
require './lib/game'

class GameTest < Minitest::Test
  def test_round_count
    skip
    mastermind = Game.new
    assert_equal 0, mastermind.count

    mastermind.play_round
    assert_equal 1, mastermind.count

    mastermind.play_round
    assert_equal 2, mastermind.count
  end

  def test_introduction
    mastermind = Game.new
    
  end
end

require_relative 'test_helper'

class PlayerTest < Minitest::Test
  def test_player_can_statically_place_ships
    player = Player.new("dan", Fleet.new)
    player.static_ship_placement

    assert_equal "A1 A2", player.fleet.ships.first.location
    assert_equal "B1 B2 B3", player.fleet.ships[1].location
  end

  def test_different_players_have_different_fleets
    player1 = Player.new("dan", Fleet.new)

    player2 = Player.new("stan", Fleet.new)
    player2.fleet.ships.slice!(0)

    assert_equal 2, player1.fleet.ships.count
    assert_equal 1, player2.fleet.ships.count
  end

  def test_player_can_randomly_place_ships
    skip
    # is it random? probably
  end

  def test_player_has_name
    player1 = Player.new("dan", Fleet.new)
    assert_equal "dan", player1.name
  end
end

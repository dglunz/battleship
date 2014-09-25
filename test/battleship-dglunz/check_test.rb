require_relative 'test_helper'

class CheckTest < Minitest::Test
  def test_check_hits
    fleet  = Fleet.new
    player = Player.new("dan", fleet )
    player.static_ship_placement
    assert_equal 1, Check.attack(player, "A1").length
    assert_equal 1, Check.attack(player, "A2").length

    assert_equal 1, Check.attack(player, "B1").length
    assert_equal 1, Check.attack(player, "B2").length
    assert_equal 1, Check.attack(player, "B3").length

  end

  def test_check_misses
    fleet  = Fleet.new
    player = Player.new("dan", fleet )
    player.static_ship_placement
    assert_equal 0, Check.attack(player, "A3").length
    assert_equal 0, Check.attack(player, "A4").length

    assert_equal 0, Check.attack(player, "B4").length

    assert_equal 0, Check.attack(player, "C1").length
    assert_equal 0, Check.attack(player, "C2").length
    assert_equal 0, Check.attack(player, "C3").length
    assert_equal 0, Check.attack(player, "C4").length

    assert_equal 0, Check.attack(player, "D1").length
    assert_equal 0, Check.attack(player, "D2").length
    assert_equal 0, Check.attack(player, "D3").length
    assert_equal 0, Check.attack(player, "D4").length
  end

  def test_returns_correct_ship_on_hit
    fleet  = Fleet.new
    player = Player.new("dan", fleet )

    player.static_ship_placement
    result = Check.attack(player, "A1")
    assert_equal "Patrol Boat", result.first.name
    assert_equal 2, result.first.size

    result = Check.attack(player, "B1")
    assert_equal "Destroyer", result.first.name
    assert_equal 3, result.first.size
  end
end

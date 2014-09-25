require_relative 'test_helper'

class ShipTest < Minitest::Test
  def test_can_modify_ship_location
      patrol_boat = Ship.new("Patrol Boat", 2, "X")
      destroyer   = Ship.new("Destroyer", 3, "Y")
      assert patrol_boat.location.nil?

      patrol_boat.location = 'D1 D2'
      assert_equal 'D1 D2', patrol_boat.location
  end
end

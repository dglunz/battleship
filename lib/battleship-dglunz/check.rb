module Check

  def self.attack(player, coordinates)
    player.fleet.ships.select do |ship|
      ship.location.include?(coordinates)
    end
  end

end

# require_relative 'player'
# require_relative 'ship'
# fleet    = [
#               patrol_boat = Ship.new("Patrol Boat", 2, "X"),
#               destroyer   = Ship.new("Destroyer", 3, "Y")
#             ]
# player =Player.new("dan", fleet )
# player.static_ship_placement
# Check.attack(player, "b3")

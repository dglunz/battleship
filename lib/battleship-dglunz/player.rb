class Player
  attr_reader :name,
              :fleet

  def initialize(name, ships)
    @name  = name
    @fleet = ships
  end

  def add_ship(ship)
    @fleet << ship
  end

  def random_ship_placement
    fleet.each do |ship|
      ship.location = generate_random_coordinates(ship)
    end
  end

  private

  def generate_random_coordinates(ship)
    coordinates = []
    ship.size.times do
      coordinates << %w(a b c d).sample + ['1','2','3','4'].sample
    end
    coordinates.join(" ")
  end

  def update_ship_location(ship)
    ship.location = coordinates
  end

end

# require_relative 'ship'
# fleet    = [
#               patrol_boat = Ship.new("Patrol Boat", 2, "X"),
#               destroyer   = Ship.new("Destroyer", 3, "Y")
#             ]
# player =Player.new("dan", fleet )
# player.random_ship_placement

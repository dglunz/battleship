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

  def static_ship_placement
    fleet[0].location = 'a1 a2'
    fleet[1].location = 'b1 b2 b3'
  end

  private


  # def generate_random_coordinates(ship)
  #   coordinates = []
  #   row =  %w(a b c d)
  #   column = %w(1 2 3 4)
  #   flip = [1, 2].sample
  #   coordinate_base = row.sample + column.sample
  #   ship.size.times do |index|
  #     if flip == 1
  #       coordinates << coordinate_base[0] + column[column.index(coordinate_base[1])]
  #     else
  #       coordinates << row.sample + coordinate_base[1]
  #     end
  #   end
  #   coordinates.join(" ")
  # end

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

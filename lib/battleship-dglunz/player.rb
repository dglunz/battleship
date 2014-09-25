class Player
  attr_reader :name,
              :fleet

  def initialize(name, fleet)
    @name  = name
    @fleet = fleet
  end

  def random_ship_placement
    fleet.ships.each do |ship|
      ship.location = generate_random_coordinates(ship)
    end
  end

  def static_ship_placement
    fleet.ships[0].location = 'A1 A2'
    fleet.ships[1].location = 'B1 B2 B3'
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

end

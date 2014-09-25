class Player
  attr_reader :name,  # => :name
              :fleet  # => nil

  def initialize(name, fleet)
    @name  = name              # => "dan"
    @fleet = fleet             # => #<Fleet:0x007f96b2041ca8 @ships=[#<Ship:0x007f96b2041c30 @name="Patrol Boat", @size=2, @location=nil, @symbol="X">, #<Ship:0x007f96b2041bb8 @name="Destroyer", @size=3, @location=nil, @symbol="Y">]>
  end

  def add_ship(ship)
    @fleet.ships << ship
  end

  def random_ship_placement
    fleet.ships.each do |ship|
      ship.location = generate_random_coordinates(ship)
    end
  end

  def static_ship_placement
    fleet.ships[0].location = 'A1 A2'     # => "a1 a2"
    fleet.ships[1].location = 'B1 B2 B3'  # => "b1 b2 b3"
  end

  private  # => Player


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

# require_relative 'fleet'            # => true
# fleet  = Fleet.new                  # => #<Fleet:0x007f96b2041ca8 @ships=[#<Ship:0x007f96b2041c30 @name="Patrol Boat", @size=2, @location=nil, @symbol="X">, #<Ship:0x007f96b2041bb8 @name="Destroyer", @size=3, @location=nil, @symbol="Y">]>
# player = Player.new("dan", fleet )  # => #<Player:0x007f96b2040e70 @name="dan", @fleet=#<Fleet:0x007f96b2041ca8 @ships=[#<Ship:0x007f96b2041c30 @name="Patrol Boat", @size=2, @location=nil, @symbol="X">, #<Ship:0x007f96b2041bb8 @name="Destroyer", @size=3, @location=nil, @symbol="Y">]>>
# player.static_ship_placement        # => "b1 b2 b3"
# player.fleet                        # => #<Fleet:0x007f96b2041ca8 @ships=[#<Ship:0x007f96b2041c30 @name="Patrol Boat", @size=2, @location="a1 a2", @symbol="X">, #<Ship:0x007f96b2041bb8 @name="Destroyer", @size=3, @location="b1 b2 b3", @symbol="Y">]>

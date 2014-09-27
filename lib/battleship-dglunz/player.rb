class Player
  attr_reader :name,                    # => :name
              :fleet,                   # => :fleet
              :coordinate_base,         # => :coordinate_base
              :random_ship_coordinates  # => nil

  def initialize(name, fleet)
    @name  = name                  # => "Dan"
    @fleet = fleet                 # => #<Fleet:0x007ffbab124ec8 @ships=[#<Ship:0x007ffbab124e50 @name="Patrol Boat", @size=2, @location=nil, @symbol="X">, #<Ship:0x007ffbab124dd8 @name="Destroyer", @size=3, @location=nil, @symbol="Y">]>
    @coordinate_base = ''          # => ""
    @random_ship_coordinates = []  # => []
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


  def generate_random_coordinates(ship)
    coordinates = []                                                                         # => []
    row =  %w(a b c d)                                                                       # => ["a", "b", "c", "d"]
    column = %w(1 2 3 4)                                                                     # => ["1", "2", "3", "4"]
    flip = [1, 2].sample                                                                     # => 2
    coordinate_base = row.sample + column.sample                                             # => "a4"
    coordinate_extension = extend_from_coordinate_base(coordinate_base).sample(ship.size-1)  # => ["d4"]

    coordinate_base + " " + coordinate_extension.join()                                      # => "a4 d4"
  end

  def extend_from_coordinate_base(coordinate_base)
    x = coordinate_base[0]                          # => "a"
    y = coordinate_base[1]                          # => "4"

    row =  %w(a b c d)         # => ["a", "b", "c", "d"]
    x_index = row.index(x)     # => 0

    random_possible = [
      [row[x_index + 1] , y],  # => ["b", "4"]
      [row[x_index - 1] , y],  # => ["d", "4"]
      [x, y.to_i + 1],         # => ["a", 5]
      [x, y.to_i - 1]          # => ["a", 3]
    ]                          # => [["b", "4"], ["d", "4"], ["a", 5], ["a", 3]]

    random_possible.delete_if {|coordinate| coordinate.include?(nil) }  # => [["b", "4"], ["d", "4"], ["a", 5], ["a", 3]]

    random_possible.map! do |coordinate|  # => [["b", "4"], ["d", "4"], ["a", 5], ["a", 3]]
      coordinate.join("")                 # => "b4", "d4", "a5", "a3"
    end                                   # => ["b4", "d4", "a5", "a3"]

    random_ship_coordinates = random_possible.select do |coordinate|  # => ["b4", "d4", "a5", "a3"]
      coordinate_checker?(coordinate)                                 # => true, true, false, true
    end                                                               # => ["b4", "d4", "a3"]

    random_ship_coordinates  # => ["b4", "d4", "a3"]
  end

  def coordinate_checker?(coordinate)
    within_row_range?(coordinate)      # => true, true, false, true
  end

  def within_row_range?(coordinates)
    coordinates[1].to_i.between?(1,4) ? within_column_range?(coordinates) : false  # => true, true, false, true
  end

  def within_column_range?(coordinates)
    coordinates[0].scan(/[^abcd]/).length == 0 ? not_overlapping?(coordinates) : false  # => true, true, true
  end

  def not_overlapping?(coordinates)
    if fleet.ships[0].location.nil?                                    # => true, true, true
      true ? not_diagonal?(coordinates) : false                        # => true, true, true
    else
      not_overlapping = coordinates.split(" ").select do |coordinate|
          fleet.ships[0].location.include?(coordinates)
      end
      not_overlapping.count == 0 ? not_diagonal?(coordinates) : false
    end                                                                # => true, true, true
  end

  def not_diagonal?(coordinates)
    #coordinate base will be nil if you call this without base
    vertical = %w(a b c d)                                                        # => ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"]
    horizontal = %w(1 2 3 4)                                                      # => ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"]
    @coordinate_base = coordinates                                                # => "b4", "d4", "a3"
    h = horizontal.index(coordinates[1]) - horizontal.index(@coordinate_base[1])  # => 0, 0, 0
    v = vertical.index(coordinates[0]) - vertical.index(@coordinate_base[0])      # => 0, 0, 0
    t = h.abs + v.abs                                                             # => 0, 0, 0
    t < 1                                                                         # => true, true, true
  end

end

require_relative 'fleet'                                   # => true
player = Player.new("Dan", Fleet.new)                      # => #<Player:0x007ffbab124d88 @name="Dan", @fleet=#<Fleet:0x007ffbab124ec8 @ships=[#<Ship:0x007ffbab124e50 @name="Patrol Boat", @size=2, @location=nil, @symbol="X">, #<Ship:0x007ffbab124dd8 @name="Destroyer", @size=3, @location=nil, @symbol="Y">]>, @coordinate_base="", @random_ship_coordinates=[]>
# player.coordinate_checker?('c1')       # => true
player.generate_random_coordinates(player.fleet.ships[0])  # => "a4 d4"
player.coordinate_base                                     # => "a3"

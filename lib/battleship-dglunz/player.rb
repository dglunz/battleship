class Player
  attr_reader :name,                    # => :name
              :fleet,                   # => :fleet
              :coordinate_base,         # => :coordinate_base
              :random_ship_coordinates  # => nil

  def initialize(name, fleet)
    @name  = name                  # => "Dan"
    @fleet = fleet                 # => #<Fleet:0x007ff6ad098ed0 @ships=[#<Ship:0x007ff6ad098e58 @name="Patrol Boat", @size=2, @location=nil, @symbol="X">, #<Ship:0x007ff6ad098de0 @name="Destroyer", @size=3, @location=nil, @symbol="Y">]>
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
    until @random_ship_coordinates.length == ship.size  # => false, false, false, false, false, false, false, false, false, false, false, true
      coordinates = []                                  # => [], [], [], [], [], [], [], [], [], [], []
      row =  %w(a b c d)                                # => ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"]
      column = %w(1 2 3 4)                              # => ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"]
      flip = [1, 2].sample                              # => 1, 1, 2, 2, 2, 1, 1, 2, 2, 1, 2
      @coordinate_base = row.sample + column.sample     # => "a2", "c3", "b1", "c4", "b4", "b3", "a4", "c4", "d3", "c2", "d1"
      extend_from_coordinate_base(coordinate_base)      # => ["b2", "d2", "a3", "a1"], ["d3", "b3", "c4", "c2"], ["c1", "a1", "b2"], ["d4", "b4", "c3"], ["c4", "a4", "b3"], ["c3", "a3", "b4", "b2"], ["b4", "d4", "a3"], ["d4", "b4", "c3"], ["c3", "d4", "d2"], ["d2", "b2", "c3", "c1"], ["c1", "d2"]
    end                                                 # => nil
  end

  def extend_from_coordinate_base(coordinate_base)
    # determine usable directions by invalidating with within_row_range? and within_column_range?
    #   - take coordinate_base x, increase by 1, see if it passes all tests
    #   - take coordinate_base y, increase by 1, see if it passes all tests
    #   - take coordinate_base x, decrease by 1, see if it passes all tests
    #   - take coordinate_base y, decrease by 1, see if it passes all tests
    # then validate to make sure overlapping? and diagonal? are false
    x = coordinate_base[0]                          # => "a", "c", "b", "c", "b", "b", "a", "c", "d", "c", "d"
    row =  %w(a b c d)                              # => ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"]
    x_index = row.index(x)                          # => 0, 2, 1, 2, 1, 1, 0, 2, 3, 2, 3
    y = coordinate_base[1]                          # => "2", "3", "1", "4", "4", "3", "4", "4", "3", "2", "1"
    random_possible = [
      [row[x_index + 1] , y],                       # => ["b", "2"], ["d", "3"], ["c", "1"], ["d", "4"], ["c", "4"], ["c", "3"], ["b", "4"], ["d", "4"], [nil, "3"], ["d", "2"], [nil, "1"]
      [row[x_index - 1] , y],                       # => ["d", "2"], ["b", "3"], ["a", "1"], ["b", "4"], ["a", "4"], ["a", "3"], ["d", "4"], ["b", "4"], ["c", "3"], ["b", "2"], ["c", "1"]
      [x, y.to_i + 1],                              # => ["a", 3], ["c", 4], ["b", 2], ["c", 5], ["b", 5], ["b", 4], ["a", 5], ["c", 5], ["d", 4], ["c", 3], ["d", 2]
      [x, y.to_i - 1]                               # => ["a", 1], ["c", 2], ["b", 0], ["c", 3], ["b", 3], ["b", 2], ["a", 3], ["c", 3], ["d", 2], ["c", 1], ["d", 0]
    ]                                               # => [["b", "2"], ["d", "2"], ["a", 3], ["a", 1]], [["d", "3"], ["b", "3"], ["c", 4], ["c", 2]], [["c", "1"], ["a", "1"], ["b", 2], ["b", 0]], [["d", "4"], ["b", "4"], ["c", 5], ["c", 3]], [["c", "4"], ["a", "4"], ["b", 5], ["b", 3]], [["c", "3"], ["a", "3"], ["b", 4], ["b", 2]], [["b", "4"], ["d", "4"], ["a", 5], ["a", 3]], [["d", "4"], ["b", "4"], ["c", 5], ["c", 3]], [[nil, "3"], ["c", "3"], ["d", 4], ["d", 2]], [["d", "2"], ["b", "2"], ["c", 3], ["c", 1]], [[nil, "1"], ["c", "1"], ["d", 2], ["d", 0]]

    random_possible.delete_if {|coordinate| coordinate.include?(nil) }  # => [["b", "2"], ["d", "2"], ["a", 3], ["a", 1]], [["d", "3"], ["b", "3"], ["c", 4], ["c", 2]], [["c", "1"], ["a", "1"], ["b", 2], ["b", 0]], [["d", "4"], ["b", "4"], ["c", 5], ["c", 3]], [["c", "4"], ["a", "4"], ["b", 5], ["b", 3]], [["c", "3"], ["a", "3"], ["b", 4], ["b", 2]], [["b", "4"], ["d", "4"], ["a", 5], ["a", 3]], [["d", "4"], ["b", "4"], ["c", 5], ["c", 3]], [["c", "3"], ["d", 4], ["d", 2]], [["d", "2"], ["b", "2"], ["c", 3], ["c", 1]], [["c", "1"], ["d", 2], ["d", 0]]

    random_possible.map! do |coordinate|  # => [["b", "2"], ["d", "2"], ["a", 3], ["a", 1]], [["d", "3"], ["b", "3"], ["c", 4], ["c", 2]], [["c", "1"], ["a", "1"], ["b", 2], ["b", 0]], [["d", "4"], ["b", "4"], ["c", 5], ["c", 3]], [["c", "4"], ["a", "4"], ["b", 5], ["b", 3]], [["c", "3"], ["a", "3"], ["b", 4], ["b", 2]], [["b", "4"], ["d", "4"], ["a", 5], ["a", 3]], [["d", "4"], ["b", "4"], ["c", 5], ["c", 3]], [["c", "3"], ["d", 4], ["d", 2]], [["d", "2"], ["b", "2"], ["c", 3], ["c", 1]], [["c", "1"], ["d", 2], ["d", 0]]
      coordinate.join("")                 # => "b2", "d2", "a3", "a1", "d3", "b3", "c4", "c2", "c1", "a1", "b2", "b0", "d4", "b4", "c5", "c3", "c4", "a4", "b5", "b3", "c3", "a3", "b4", "b2", "b4", "d4", "a5", "a3", "d4", "b4", "c5", "c3", "c3", "d4", "d2", "d2", "b2", "c3", "c1", "c1", "d2", "d0"
    end                                   # => ["b2", "d2", "a3", "a1"], ["d3", "b3", "c4", "c2"], ["c1", "a1", "b2", "b0"], ["d4", "b4", "c5", "c3"], ["c4", "a4", "b5", "b3"], ["c3", "a3", "b4", "b2"], ["b4", "d4", "a5", "a3"], ["d4", "b4", "c5", "c3"], ["c3", "d4", "d2"], ["d2", "b2", "c3", "c1"], ["c1", "d2", "d0"]

    @random_ship_coordinates = random_possible.select do |coordinate|  # => ["b2", "d2", "a3", "a1"], ["d3", "b3", "c4", "c2"], ["c1", "a1", "b2", "b0"], ["d4", "b4", "c5", "c3"], ["c4", "a4", "b5", "b3"], ["c3", "a3", "b4", "b2"], ["b4", "d4", "a5", "a3"], ["d4", "b4", "c5", "c3"], ["c3", "d4", "d2"], ["d2", "b2", "c3", "c1"], ["c1", "d2", "d0"]
      coordinate_checker?(coordinate)                                  # => true, true, true, true, true, true, true, true, true, true, true, false, true, true, false, true, true, true, false, true, true, true, true, true, true, true, false, true, true, true, false, true, true, true, true, true, true, true, true, true, true, false
    end                                                                # => ["b2", "d2", "a3", "a1"], ["d3", "b3", "c4", "c2"], ["c1", "a1", "b2"], ["d4", "b4", "c3"], ["c4", "a4", "b3"], ["c3", "a3", "b4", "b2"], ["b4", "d4", "a3"], ["d4", "b4", "c3"], ["c3", "d4", "d2"], ["d2", "b2", "c3", "c1"], ["c1", "d2"]

    @coordinate_base                                                   # => "a1", "c2", "b2", "c3", "b3", "b2", "a3", "c3", "d2", "c1", "d2"
    @random_ship_coordinates                                           # => ["b2", "d2", "a3", "a1"], ["d3", "b3", "c4", "c2"], ["c1", "a1", "b2"], ["d4", "b4", "c3"], ["c4", "a4", "b3"], ["c3", "a3", "b4", "b2"], ["b4", "d4", "a3"], ["d4", "b4", "c3"], ["c3", "d4", "d2"], ["d2", "b2", "c3", "c1"], ["c1", "d2"]


  end

  def coordinate_checker?(coordinate)
    within_row_range?(coordinate)      # => true, true, true, true, true, true, true, true, true, true, true, false, true, true, false, true, true, true, false, true, true, true, true, true, true, true, false, true, true, true, false, true, true, true, true, true, true, true, true, true, true, false
  end

  def within_row_range?(coordinates)
    coordinates[1].to_i.between?(1,4) ? within_column_range?(coordinates) : false  # => true, true, true, true, true, true, true, true, true, true, true, false, true, true, false, true, true, true, false, true, true, true, true, true, true, true, false, true, true, true, false, true, true, true, true, true, true, true, true, true, true, false
  end

  def within_column_range?(coordinates)
    coordinates[0].scan(/[^abcd]/).length == 0 ? not_overlapping?(coordinates) : false  # => true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true
  end

  def not_overlapping?(coordinates)
    if fleet.ships[0].location.nil?                                    # => true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true
      true ? not_diagonal?(coordinates) : false                        # => true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true
    else
      not_overlapping = coordinates.split(" ").select do |coordinate|
          fleet.ships[0].location.include?(coordinates)
      end
      not_overlapping.count == 0 ? not_diagonal?(coordinates) : false
    end                                                                # => true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true
  end

  def not_diagonal?(coordinates)
    #coordinate base will be nil if you call this without base
    vertical = %w(a b c d)                                                        # => ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"]
    horizontal = %w(1 2 3 4)                                                      # => ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"]
    @coordinate_base = coordinates                                                # => "b2", "d2", "a3", "a1", "d3", "b3", "c4", "c2", "c1", "a1", "b2", "d4", "b4", "c3", "c4", "a4", "b3", "c3", "a3", "b4", "b2", "b4", "d4", "a3", "d4", "b4", "c3", "c3", "d4", "d2", "d2", "b2", "c3", "c1", "c1", "d2"
    h = horizontal.index(coordinates[1]) - horizontal.index(@coordinate_base[1])  # => 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    v = vertical.index(coordinates[0]) - vertical.index(@coordinate_base[0])      # => 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    t = h.abs + v.abs                                                             # => 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    t < 1                                                                         # => true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true
  end

end

require_relative 'fleet'                                   # => true
player = Player.new("Dan", Fleet.new)                      # => #<Player:0x007ff6ad098d90 @name="Dan", @fleet=#<Fleet:0x007ff6ad098ed0 @ships=[#<Ship:0x007ff6ad098e58 @name="Patrol Boat", @size=2, @location=nil, @symbol="X">, #<Ship:0x007ff6ad098de0 @name="Destroyer", @size=3, @location=nil, @symbol="Y">]>, @coordinate_base="", @random_ship_coordinates=[]>
# player.coordinate_checker?('c1')       # => true
player.generate_random_coordinates(player.fleet.ships[0])  # => nil

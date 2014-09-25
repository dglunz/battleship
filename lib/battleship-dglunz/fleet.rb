require_relative 'ship'
class Fleet
  attr_accessor :ships
  def initialize(size=2)
    @ships    = [
                  patrol_boat = Ship.new("Patrol Boat", 2, "X"),
                  destroyer   = Ship.new("Destroyer", 3, "Y")
                ]
  end
end

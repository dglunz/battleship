class Ship
  attr_reader   :name,
                :size,
                :symbol

  attr_accessor :location

  def initialize(name, size, location=nil, symbol)
    @name = name
    @size = size
    @location = location
    @symbol = symbol
  end

end

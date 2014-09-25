class Player
  attr_reader :name,
              :board,
              :fleet

  def initialize(name, board, ships)
    @name  = name
    @board = board
    @fleet = ships
  end

  def add_ship(ship)
    @fleet << ship
  end
end

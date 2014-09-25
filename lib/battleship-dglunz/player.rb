class Player
  attr_reader
  def initialize(name="Bot", board, ships)
    @name  = name
    @board = board
    @fleet = ships
  end
end

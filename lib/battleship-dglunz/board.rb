require 'terminal-table'

class Board
  attr_reader :target_rows,
              :ocean_rows,
              :table

  def initialize(size=4)
    clear_rows
    @target_title       = "Target Grid"
    @ocean_title        = "Ocean Grid"
    @header      = [' ', '1', '2', '3', '4']
    fill_empty_rows
    create_new_table
  end

  def add_ship(ship)
    ship.location.split(" ").each do |coordinate|
      row = coordinate[0].to_sym
      column = coordinate[1].to_i
      @ocean_rows[row][column] = ship.symbol
    end
    create_new_table
  end

  def edit_row(result)
    clear_rows
    fill_existing_table(history)
    create_new_table
  end

  # def finished(round, history, final)
  #   clear_rows
  #   @title = "Game Over"
  #   @rows << ['Final', final , " ", " "]
  #   fill_existing_table(history)
  #   create_new_table
  # end

  def show_both
    show_target
    show_ocean
  end

  def show_target
    puts @target_grid
  end

  def show_ocean
    puts @ocean_grid
  end

  def target_hit(coordinate)
    row = coordinate[0].to_sym
    column = coordinate[1].to_i
    @target_rows[row][column] = "H"
    create_new_table
  end

  def target_miss(coordinate)
    row = coordinate[0].to_sym
    column = coordinate[1].to_i
    @target_rows[row][column] = "M"
    create_new_table
  end

  def ocean_hit

  end

  def ocean_miss

  end

  private

  def fill_empty_rows(last_row=1)
    border_letters = ['A','B','C','D']
    border_letters.each do |x|
      @target_rows[x.to_sym] = [x, " ", " ", " ", " "]
      @ocean_rows[x.to_sym] = [x, " ", " ", " ", " "]
    end
  end

  def create_new_table
    target_grid = Terminal::Table.new :title => @target_title,
                                      :headings => @header,
                                      :rows => @target_rows.values

    ocean_grid = Terminal::Table.new :title => @ocean_title,
                                     :headings => @header,
                                     :rows => @ocean_rows.values

    @target_grid = target_grid
    @ocean_grid  = ocean_grid
  end

  def clear_rows
    @target_rows = {A: [], B: [], C: [], D: []}
    @ocean_rows = {A: [], B: [], C: [], D: []}
  end

end

# player_1 = Board.new
# player_1.target_rows
# player_1.target_rows[:A][0]
# x_sym = "A".to_sym
# player_1.target_rows.values
# require_relative 'ship'
# skip = Ship.new("Skipper", 3, "A1 A2 A3", "W")
# player_1.add_ship(skip)
# player_1.show_both

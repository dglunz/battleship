require 'terminal-table'  # => true

class Board
  attr_reader :target_rows,  # => :target_rows
              :ocean_rows,   # => :ocean_rows
              :table         # => nil

  def initialize(size=4)
    clear_rows                                # => {:A=>[], :B=>[], :C=>[], :D=>[]}
    @target_title       = "Target Grid"       # => "Target Grid"
    @ocean_title        = "Ocean Grid"        # => "Ocean Grid"
    @header      = [' ', '1', '2', '3', '4']  # => [" ", "1", "2", "3", "4"]
    fill_empty_rows                           # => ["A", "B", "C", "D"]
    create_new_table                          # => #<Terminal::Table:0x007ff8050a83e0 @column_widths=[1, 1, 1, 1, 1], @style=#<Terminal::Table::Style:0x007ff8050a8368 @border_x="-", @border_y="|", @border_i="+", @padding_left=1, @padding_right=1, @width=nil>, @headings=#<Terminal::Table::Row:0x007ff8050a8098 @cell_index=5, @table=#<Terminal::Table:0x007ff8050a83e0 ...>, @cells=[#<Terminal::Table::Cell:0x007ff8050a3f48 @value=" ", @alignment=nil, @colspan=1, @width=1, @index=0, @table=#<Terminal::Table:0x007ff8050a83e0 ...>>, #<Terminal::Table::Cell:0x007ff8050a3e80 @value="1", @alignment=nil, @colspan=1, @width=1, @index=1, @table=#<Terminal::Table:0x007ff8050a83e0 ...>>, #<Terminal::Table::Cell:0x007ff8050a3db8 @value="2", @alignment=nil, @colspan=1, @width=1, @index=2, @table=#<Terminal::Table:0x007ff8050a83e0 ...>>, #<Terminal::Table::Cell:0x007ff8050a3cf0 @value="3", @alignment=nil, @colspan=1, @width=1, @index=3, @table=#<Terminal::Table:0x007ff8050a83e0 ...>>, #<Terminal::Tabl...
  end

  def add_ship(ship)
    ship.location.split(" ").each do |coordinate|  # => ["A1", "A2", "A3"]
      row = coordinate[0].to_sym                   # => :A, :A, :A
      column = coordinate[1].to_i                  # => 1, 2, 3
      @ocean_rows[row][column] = ship.symbol       # => "W", "W", "W"
    end                                            # => ["A1", "A2", "A3"]
    create_new_table                               # => #<Terminal::Table:0x007ff805057ad0 @column_widths=[1, 1, 1, 1, 1], @style=#<Terminal::Table::Style:0x007ff805057a58 @border_x="-", @border_y="|", @border_i="+", @padding_left=1, @padding_right=1, @width=nil>, @headings=#<Terminal::Table::Row:0x007ff805057698 @cell_index=5, @table=#<Terminal::Table:0x007ff805057ad0 ...>, @cells=[#<Terminal::Table::Cell:0x007ff805057530 @value=" ", @alignment=nil, @colspan=1, @width=1, @index=0, @table=#<Terminal::Table:0x007ff805057ad0 ...>>, #<Terminal::Table::Cell:0x007ff805057468 @value="1", @alignment=nil, @colspan=1, @width=1, @index=1, @table=#<Terminal::Table:0x007ff805057ad0 ...>>, #<Terminal::Table::Cell:0x007ff8050573a0 @value="2", @alignment=nil, @colspan=1, @width=1, @index=2, @table=#<Terminal::Table:0x007ff805057ad0 ...>>, #<Terminal::Table::Cell:0x007ff8050572d8 @value="3", @alignment=nil, @colspan=1, @width=1, @index=3, @table=#<Terminal::Table:0x007ff805057ad0 ...>>, #<Terminal:...
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
    puts @target_grid  # => nil
    puts @ocean_grid   # => nil
  end

  def show_target
    puts @target_grid
  end

  def show_ocean
    puts @ocean_grid
  end

  private  # => Board

  def target_hit

  end

  def target_missed

  end

  def ocean_hit

  end

  def ocean_miss

  end

  def fill_empty_rows(last_row=1)
    border_letters = ['A','B','C','D']                  # => ["A", "B", "C", "D"]
    border_letters.each do |x|                          # => ["A", "B", "C", "D"]
      @target_rows[x.to_sym] = [x, " ", " ", " ", " "]  # => ["A", " ", " ", " ", " "], ["B", " ", " ", " ", " "], ["C", " ", " ", " ", " "], ["D", " ", " ", " ", " "]
      @ocean_rows[x.to_sym] = [x, " ", " ", " ", " "]   # => ["A", " ", " ", " ", " "], ["B", " ", " ", " ", " "], ["C", " ", " ", " ", " "], ["D", " ", " ", " ", " "]
    end                                                 # => ["A", "B", "C", "D"]
  end

  def create_new_table
    target_grid = Terminal::Table.new :title => @target_title,      # => "Target Grid", "Target Grid"
                                      :headings => @header,         # => [" ", "1", "2", "3", "4"], [" ", "1", "2", "3", "4"]
                                      :rows => @target_rows.values  # => #<Terminal::Table:0x007ff8050cc038 @column_widths=[1, 1, 1, 1, 1], @style=#<Terminal::Table::Style:0x007ff8050cc448 @border_x="-", @border_y="|", @border_i="+", @padding_left=1, @padding_right=1, @width=nil>, @headings=#<Terminal::Table::Row:0x007ff8050bbd28 @cell_index=5, @table=#<Terminal::Table:0x007ff8050cc038 ...>, @cells=[#<Terminal::Table::Cell:0x007ff8050bb5d0 @value=" ", @alignment=nil, @colspan=1, @width=1, @index=0, @table=#<Terminal::Table:0x007ff8050cc038 ...>>, #<Terminal::Table::Cell:0x007ff8050bb300 @value="1", @alignment=nil, @colspan=1, @width=1, @index=1, @table=#<Terminal::Table:0x007ff8050cc038 ...>>, #<Terminal::Table::Cell:0x007ff8050bb0d0 @value="2", @alignment=nil, @colspan=1, @width=1, @index=2, @table=#<Terminal::Table:0x007ff8050cc038 ...>>, #<Terminal::Table::Cell:0x007ff8050bafe0 @value="3", @alignment=nil, @colspan=1, @width=1, @index=3, @table=#<Terminal::Table:0x007ff8050cc038 ....

    ocean_grid = Terminal::Table.new :title => @ocean_title,      # => "Ocean Grid", "Ocean Grid"
                                     :headings => @header,        # => [" ", "1", "2", "3", "4"], [" ", "1", "2", "3", "4"]
                                     :rows => @ocean_rows.values  # => #<Terminal::Table:0x007ff8050a83e0 @column_widths=[1, 1, 1, 1, 1], @style=#<Terminal::Table::Style:0x007ff8050a8368 @border_x="-", @border_y="|", @border_i="+", @padding_left=1, @padding_right=1, @width=nil>, @headings=#<Terminal::Table::Row:0x007ff8050a8098 @cell_index=5, @table=#<Terminal::Table:0x007ff8050a83e0 ...>, @cells=[#<Terminal::Table::Cell:0x007ff8050a3f48 @value=" ", @alignment=nil, @colspan=1, @width=1, @index=0, @table=#<Terminal::Table:0x007ff8050a83e0 ...>>, #<Terminal::Table::Cell:0x007ff8050a3e80 @value="1", @alignment=nil, @colspan=1, @width=1, @index=1, @table=#<Terminal::Table:0x007ff8050a83e0 ...>>, #<Terminal::Table::Cell:0x007ff8050a3db8 @value="2", @alignment=nil, @colspan=1, @width=1, @index=2, @table=#<Terminal::Table:0x007ff8050a83e0 ...>>, #<Terminal::Table::Cell:0x007ff8050a3cf0 @value="3", @alignment=nil, @colspan=1, @width=1, @index=3, @table=#<Terminal::Table:0x007ff8050a83e0 ......

    @target_grid = target_grid  # => #<Terminal::Table:0x007ff8050cc038 @column_widths=[1, 1, 1, 1, 1], @style=#<Terminal::Table::Style:0x007ff8050cc448 @border_x="-", @border_y="|", @border_i="+", @padding_left=1, @padding_right=1, @width=nil>, @headings=#<Terminal::Table::Row:0x007ff8050bbd28 @cell_index=5, @table=#<Terminal::Table:0x007ff8050cc038 ...>, @cells=[#<Terminal::Table::Cell:0x007ff8050bb5d0 @value=" ", @alignment=nil, @colspan=1, @width=1, @index=0, @table=#<Terminal::Table:0x007ff8050cc038 ...>>, #<Terminal::Table::Cell:0x007ff8050bb300 @value="1", @alignment=nil, @colspan=1, @width=1, @index=1, @table=#<Terminal::Table:0x007ff8050cc038 ...>>, #<Terminal::Table::Cell:0x007ff8050bb0d0 @value="2", @alignment=nil, @colspan=1, @width=1, @index=2, @table=#<Terminal::Table:0x007ff8050cc038 ...>>, #<Terminal::Table::Cell:0x007ff8050bafe0 @value="3", @alignment=nil, @colspan=1, @width=1, @index=3, @table=#<Terminal::Table:0x007ff8050cc038 ...>>, #<Terminal::Table::Cell:0x007f...
    @ocean_grid  = ocean_grid   # => #<Terminal::Table:0x007ff8050a83e0 @column_widths=[1, 1, 1, 1, 1], @style=#<Terminal::Table::Style:0x007ff8050a8368 @border_x="-", @border_y="|", @border_i="+", @padding_left=1, @padding_right=1, @width=nil>, @headings=#<Terminal::Table::Row:0x007ff8050a8098 @cell_index=5, @table=#<Terminal::Table:0x007ff8050a83e0 ...>, @cells=[#<Terminal::Table::Cell:0x007ff8050a3f48 @value=" ", @alignment=nil, @colspan=1, @width=1, @index=0, @table=#<Terminal::Table:0x007ff8050a83e0 ...>>, #<Terminal::Table::Cell:0x007ff8050a3e80 @value="1", @alignment=nil, @colspan=1, @width=1, @index=1, @table=#<Terminal::Table:0x007ff8050a83e0 ...>>, #<Terminal::Table::Cell:0x007ff8050a3db8 @value="2", @alignment=nil, @colspan=1, @width=1, @index=2, @table=#<Terminal::Table:0x007ff8050a83e0 ...>>, #<Terminal::Table::Cell:0x007ff8050a3cf0 @value="3", @alignment=nil, @colspan=1, @width=1, @index=3, @table=#<Terminal::Table:0x007ff8050a83e0 ...>>, #<Terminal::Table::Cell:0x007f...
  end

  def clear_rows
    @target_rows = {A: [], B: [], C: [], D: []}  # => {:A=>[], :B=>[], :C=>[], :D=>[]}
    @ocean_rows = {A: [], B: [], C: [], D: []}   # => {:A=>[], :B=>[], :C=>[], :D=>[]}
  end

end

player_1 = Board.new                            # => #<Board:0x007ff8050e4318 @target_rows={:A=>["A", " ", " ", " ", " "], :B=>["B", " ", " ", " ", " "], :C=>["C", " ", " ", " ", " "], :D=>["D", " ", " ", " ", " "]}, @ocean_rows={:A=>["A", " ", " ", " ", " "], :B=>["B", " ", " ", " ", " "], :C=>["C", " ", " ", " ", " "], :D=>["D", " ", " ", " ", " "]}, @target_title="Target Grid", @ocean_title="Ocean Grid", @header=[" ", "1", "2", "3", "4"], @target_grid=#<Terminal::Table:0x007ff8050cc038 @column_widths=[1, 1, 1, 1, 1], @style=#<Terminal::Table::Style:0x007ff8050cc448 @border_x="-", @border_y="|", @border_i="+", @padding_left=1, @padding_right=1, @width=nil>, @headings=#<Terminal::Table::Row:0x007ff8050bbd28 @cell_index=5, @table=#<Terminal::Table:0x007ff8050cc038 ...>, @cells=[#<Terminal::Table::Cell:0x007ff8050bb5d0 @value=" ", @alignment=nil, @colspan=1, @width=1, @index=0, @table=#<Terminal::Table:0x007ff8050cc038 ...>>, #<Terminal::Table::Cell:0x007ff8050bb300 @value="1", @alig...
player_1.target_rows                            # => {:A=>["A", " ", " ", " ", " "], :B=>["B", " ", " ", " ", " "], :C=>["C", " ", " ", " ", " "], :D=>["D", " ", " ", " ", " "]}
player_1.target_rows[:A][0]                     # => "A"
x_sym = "A".to_sym                              # => :A
player_1.target_rows.values                     # => [["A", " ", " ", " ", " "], ["B", " ", " ", " ", " "], ["C", " ", " ", " ", " "], ["D", " ", " ", " ", " "]]
require_relative 'ship'                         # => true
skip = Ship.new("Skipper", 3, "A1 A2 A3", "W")  # => #<Ship:0x007ff805077808 @name="Skipper", @size=3, @location="A1 A2 A3", @symbol="W">
player_1.add_ship(skip)                         # => #<Terminal::Table:0x007ff805057ad0 @column_widths=[1, 1, 1, 1, 1], @style=#<Terminal::Table::Style:0x007ff805057a58 @border_x="-", @border_y="|", @border_i="+", @padding_left=1, @padding_right=1, @width=nil>, @headings=#<Terminal::Table::Row:0x007ff805057698 @cell_index=5, @table=#<Terminal::Table:0x007ff805057ad0 ...>, @cells=[#<Terminal::Table::Cell:0x007ff805057530 @value=" ", @alignment=nil, @colspan=1, @width=1, @index=0, @table=#<Terminal::Table:0x007ff805057ad0 ...>>, #<Terminal::Table::Cell:0x007ff805057468 @value="1", @alignment=nil, @colspan=1, @width=1, @index=1, @table=#<Terminal::Table:0x007ff805057ad0 ...>>, #<Terminal::Table::Cell:0x007ff8050573a0 @value="2", @alignment=nil, @colspan=1, @width=1, @index=2, @table=#<Terminal::Table:0x007ff805057ad0 ...>>, #<Terminal::Table::Cell:0x007ff8050572d8 @value="3", @alignment=nil, @colspan=1, @width=1, @index=3, @table=#<Terminal::Table:0x007ff805057ad0 ...>>, #<Terminal::Ta...
player_1.show_both                              # => nil

# >> +---+---+---+---+---+
# >> |    Target Grid    |
# >> +---+---+---+---+---+
# >> |   | 1 | 2 | 3 | 4 |
# >> +---+---+---+---+---+
# >> | A |   |   |   |   |
# >> | B |   |   |   |   |
# >> | C |   |   |   |   |
# >> | D |   |   |   |   |
# >> +---+---+---+---+---+
# >> +---+---+---+---+---+
# >> |    Ocean Grid     |
# >> +---+---+---+---+---+
# >> |   | 1 | 2 | 3 | 4 |
# >> +---+---+---+---+---+
# >> | A | W | W | W |   |
# >> | B |   |   |   |   |
# >> | C |   |   |   |   |
# >> | D |   |   |   |   |
# >> +---+---+---+---+---+

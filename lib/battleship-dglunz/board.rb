require 'terminal-table'  # => true

class Board
  attr_reader :target_rows, :ocean_rows       # => nil
  attr_accessor :table                        # => nil
  def initialize(size=4)
    clear_rows                                # => {:A=>[], :B=>[], :C=>[], :D=>[]}
    @target_title       = "Target Grid"       # => "Target Grid"
    @ocean_title        = "Ocean Grid"        # => "Ocean Grid"
    @header      = [' ', '1', '2', '3', '4']  # => [" ", "1", "2", "3", "4"]
    fill_empty_rows                           # => ["A", "B", "C", "D"]
    create_new_table                          # => #<Terminal::Table:0x007fba040aaaa8 @column_widths=[1, 1, 1, 1, 1], @style=#<Terminal::Table::Style:0x007fba040aaa30 @border_x="-", @border_y="|", @border_i="+", @padding_left=1, @padding_right=1, @width=nil>, @headings=#<Terminal::Table::Row:0x007fba040aa788 @cell_index=5, @table=#<Terminal::Table:0x007fba040aaaa8 ...>, @cells=[#<Terminal::Table::Cell:0x007fba040aa698 @value=" ", @alignment=nil, @colspan=1, @width=1, @index=0, @table=#<Terminal::Table:0x007fba040aaaa8 ...>>, #<Terminal::Table::Cell:0x007fba040aa5d0 @value="1", @alignment=nil, @colspan=1, @width=1, @index=1, @table=#<Terminal::Table:0x007fba040aaaa8 ...>>, #<Terminal::Table::Cell:0x007fba040aa508 @value="2", @alignment=nil, @colspan=1, @width=1, @index=2, @table=#<Terminal::Table:0x007fba040aaaa8 ...>>, #<Terminal::Table::Cell:0x007fba040aa418 @value="3", @alignment=nil, @colspan=1, @width=1, @index=3, @table=#<Terminal::Table:0x007fba040aaaa8 ...>>, #<Terminal::Tabl...
  end

  def edit_row(round, history)
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

  def show
    puts @target_grid  # => nil
    puts @ocean_grid   # => nil
  end

  private  # => Board

  # def fill_existing_table(history)
  #   fill_empty_rows
  #   history.reverse.each_with_index do |round, index|
  #     @rows << [
  #       history.length - index,
  #       round[:guess],
  #       round[:elements],
  #       round[:positions]
  #       ]
  #   end
  # end

  def fill_empty_rows(last_row=1)
    border_letters = ['A','B','C','D']                  # => ["A", "B", "C", "D"]
    border_letters.each do |x|                          # => ["A", "B", "C", "D"]
      @target_rows[x.to_sym] = [x, " ", " ", " ", " "]  # => ["A", " ", " ", " ", " "], ["B", " ", " ", " ", " "], ["C", " ", " ", " ", " "], ["D", " ", " ", " ", " "]
      @ocean_rows[x.to_sym] = [x, " ", " ", " ", " "]   # => ["A", " ", " ", " ", " "], ["B", " ", " ", " ", " "], ["C", " ", " ", " ", " "], ["D", " ", " ", " ", " "]
    end                                                 # => ["A", "B", "C", "D"]
  end

  def create_new_table
    target_grid = Terminal::Table.new :title => @target_title,      # => "Target Grid"
                                      :headings => @header,         # => [" ", "1", "2", "3", "4"]
                                      :rows => @target_rows.values  # => #<Terminal::Table:0x007fba04810310 @column_widths=[1, 1, 1, 1, 1], @style=#<Terminal::Table::Style:0x007fba048101f8 @border_x="-", @border_y="|", @border_i="+", @padding_left=1, @padding_right=1, @width=nil>, @headings=#<Terminal::Table::Row:0x007fba048136f0 @cell_index=5, @table=#<Terminal::Table:0x007fba04810310 ...>, @cells=[#<Terminal::Table::Cell:0x007fba04812778 @value=" ", @alignment=nil, @colspan=1, @width=1, @index=0, @table=#<Terminal::Table:0x007fba04810310 ...>>, #<Terminal::Table::Cell:0x007fba040cff38 @value="1", @alignment=nil, @colspan=1, @width=1, @index=1, @table=#<Terminal::Table:0x007fba04810310 ...>>, #<Terminal::Table::Cell:0x007fba040cfdd0 @value="2", @alignment=nil, @colspan=1, @width=1, @index=2, @table=#<Terminal::Table:0x007fba04810310 ...>>, #<Terminal::Table::Cell:0x007fba040cfc18 @value="3", @alignment=nil, @colspan=1, @width=1, @index=3, @table=#<Terminal::Table:0x007fba04810310 ....

    ocean_grid = Terminal::Table.new :title => @ocean_title,      # => "Ocean Grid"
                                     :headings => @header,        # => [" ", "1", "2", "3", "4"]
                                     :rows => @ocean_rows.values  # => #<Terminal::Table:0x007fba040aaaa8 @column_widths=[1, 1, 1, 1, 1], @style=#<Terminal::Table::Style:0x007fba040aaa30 @border_x="-", @border_y="|", @border_i="+", @padding_left=1, @padding_right=1, @width=nil>, @headings=#<Terminal::Table::Row:0x007fba040aa788 @cell_index=5, @table=#<Terminal::Table:0x007fba040aaaa8 ...>, @cells=[#<Terminal::Table::Cell:0x007fba040aa698 @value=" ", @alignment=nil, @colspan=1, @width=1, @index=0, @table=#<Terminal::Table:0x007fba040aaaa8 ...>>, #<Terminal::Table::Cell:0x007fba040aa5d0 @value="1", @alignment=nil, @colspan=1, @width=1, @index=1, @table=#<Terminal::Table:0x007fba040aaaa8 ...>>, #<Terminal::Table::Cell:0x007fba040aa508 @value="2", @alignment=nil, @colspan=1, @width=1, @index=2, @table=#<Terminal::Table:0x007fba040aaaa8 ...>>, #<Terminal::Table::Cell:0x007fba040aa418 @value="3", @alignment=nil, @colspan=1, @width=1, @index=3, @table=#<Terminal::Table:0x007fba040aaaa8 ......

    @target_grid = target_grid  # => #<Terminal::Table:0x007fba04810310 @column_widths=[1, 1, 1, 1, 1], @style=#<Terminal::Table::Style:0x007fba048101f8 @border_x="-", @border_y="|", @border_i="+", @padding_left=1, @padding_right=1, @width=nil>, @headings=#<Terminal::Table::Row:0x007fba048136f0 @cell_index=5, @table=#<Terminal::Table:0x007fba04810310 ...>, @cells=[#<Terminal::Table::Cell:0x007fba04812778 @value=" ", @alignment=nil, @colspan=1, @width=1, @index=0, @table=#<Terminal::Table:0x007fba04810310 ...>>, #<Terminal::Table::Cell:0x007fba040cff38 @value="1", @alignment=nil, @colspan=1, @width=1, @index=1, @table=#<Terminal::Table:0x007fba04810310 ...>>, #<Terminal::Table::Cell:0x007fba040cfdd0 @value="2", @alignment=nil, @colspan=1, @width=1, @index=2, @table=#<Terminal::Table:0x007fba04810310 ...>>, #<Terminal::Table::Cell:0x007fba040cfc18 @value="3", @alignment=nil, @colspan=1, @width=1, @index=3, @table=#<Terminal::Table:0x007fba04810310 ...>>, #<Terminal::Table::Cell:0x007f...
    @ocean_grid  = ocean_grid   # => #<Terminal::Table:0x007fba040aaaa8 @column_widths=[1, 1, 1, 1, 1], @style=#<Terminal::Table::Style:0x007fba040aaa30 @border_x="-", @border_y="|", @border_i="+", @padding_left=1, @padding_right=1, @width=nil>, @headings=#<Terminal::Table::Row:0x007fba040aa788 @cell_index=5, @table=#<Terminal::Table:0x007fba040aaaa8 ...>, @cells=[#<Terminal::Table::Cell:0x007fba040aa698 @value=" ", @alignment=nil, @colspan=1, @width=1, @index=0, @table=#<Terminal::Table:0x007fba040aaaa8 ...>>, #<Terminal::Table::Cell:0x007fba040aa5d0 @value="1", @alignment=nil, @colspan=1, @width=1, @index=1, @table=#<Terminal::Table:0x007fba040aaaa8 ...>>, #<Terminal::Table::Cell:0x007fba040aa508 @value="2", @alignment=nil, @colspan=1, @width=1, @index=2, @table=#<Terminal::Table:0x007fba040aaaa8 ...>>, #<Terminal::Table::Cell:0x007fba040aa418 @value="3", @alignment=nil, @colspan=1, @width=1, @index=3, @table=#<Terminal::Table:0x007fba040aaaa8 ...>>, #<Terminal::Table::Cell:0x007f...
  end

  def clear_rows
    @target_rows = {A: [], B: [], C: [], D: []}  # => {:A=>[], :B=>[], :C=>[], :D=>[]}
    @ocean_rows = {A: [], B: [], C: [], D: []}   # => {:A=>[], :B=>[], :C=>[], :D=>[]}
  end

end

player_1 = Board.new         # => #<Board:0x007fba04813998 @target_rows={:A=>["A", " ", " ", " ", " "], :B=>["B", " ", " ", " ", " "], :C=>["C", " ", " ", " ", " "], :D=>["D", " ", " ", " ", " "]}, @ocean_rows={:A=>["A", " ", " ", " ", " "], :B=>["B", " ", " ", " ", " "], :C=>["C", " ", " ", " ", " "], :D=>["D", " ", " ", " ", " "]}, @target_title="Target Grid", @ocean_title="Ocean Grid", @header=[" ", "1", "2", "3", "4"], @target_grid=#<Terminal::Table:0x007fba04810310 @column_widths=[1, 1, 1, 1, 1], @style=#<Terminal::Table::Style:0x007fba048101f8 @border_x="-", @border_y="|", @border_i="+", @padding_left=1, @padding_right=1, @width=nil>, @headings=#<Terminal::Table::Row:0x007fba048136f0 @cell_index=5, @table=#<Terminal::Table:0x007fba04810310 ...>, @cells=[#<Terminal::Table::Cell:0x007fba04812778 @value=" ", @alignment=nil, @colspan=1, @width=1, @index=0, @table=#<Terminal::Table:0x007fba04810310 ...>>, #<Terminal::Table::Cell:0x007fba040cff38 @value="1", @alignment=nil, @colspan...
player_1.target_rows         # => {:A=>["A", " ", " ", " ", " "], :B=>["B", " ", " ", " ", " "], :C=>["C", " ", " ", " ", " "], :D=>["D", " ", " ", " ", " "]}
player_1.target_rows[:A]     # => ["A", " ", " ", " ", " "]
x_sym = "A".to_sym           # => :A
player_1.target_rows.values  # => [["A", " ", " ", " ", " "], ["B", " ", " ", " ", " "], ["C", " ", " ", " ", " "], ["D", " ", " ", " ", " "]]

player_1.show  # => nil

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
# >> | A |   |   |   |   |
# >> | B |   |   |   |   |
# >> | C |   |   |   |   |
# >> | D |   |   |   |   |
# >> +---+---+---+---+---+

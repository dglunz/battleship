require 'terminal-table'

class Board
  attr_accessor :table
  def initialize(size=4)
    @rows        = []
    @mystery_row = ['Final', "????", " ", " "]
    @title       = "Mastermind"
    @header      = ['Turn', "Guess", "E", "P"]
    @rows        << @mystery_row
    fill_empty_rows
    create_new_table
  end

  def edit_row(round, history)
    clear_rows
    @rows << @mystery_row
    fill_existing_table(history)
    create_new_table
  end

  def finished(round, history, final)
    clear_rows
    @title = "Game Over"
    @rows << ['Final', final , " ", " "]
    fill_existing_table(history)
    create_new_table
  end

  def show
    puts table
  end

  private

  def fill_existing_table(history)
    fill_empty_rows(history.length + 1)
    history.reverse.each_with_index do |round, index|
      @rows << [
        history.length - index, 
        round[:guess],
        round[:elements],
        round[:positions]
        ]
    end
  end

  def fill_empty_rows(last_row=1)
    10.downto(last_row) { |x| @rows << [x, "    ", " ", " "] }
  end

  def create_new_table
    table = Terminal::Table.new :title => @title,
                                :headings => @header,
                                :rows => @rows
    @table = table
  end

  def clear_rows
    @rows = []
  end

end

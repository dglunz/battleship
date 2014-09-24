require_relative 'display'
require_relative 'color_sequence'
require_relative 'board'

class Game
  attr_reader :round,
              :history,
              :board,
              :display

  def initialize(display)
    @history               = []
    @round                 = 0
    @display               = display
    @final_sequence        = ColorSequence.new
    @pretty_final_sequence = display.colorful(@final_sequence.colors)
    @board                 = Board.new
    @guess                 = ''
    @finished              = false
  end

  def start
    board.show
    game_loop
  end

  def game_loop
    until finished?
      get_input
      valid_input? ? play_round : invalid_input(@guess)
    end
    game_over
  end

  def play_round
    @round += 1
    @history << @final_sequence.guess(@guess)
    update_board
    show_round_result(@history.last)
  end

  def win?
    @history.last[:positions] == 4 if round > 0
  end

  def quit?
    @guess == 'q' || @guess == 'quit'
  end

  def finished?
    round_limit = 10
    round >= round_limit || quit? || win?
  end

  def show_round_result(round_result)
    display.round_result(round_result, round)
  end

  def get_input
    display.enter_guess
    @guess = gets.chomp.downcase
  end


  def update_board
    display.mastermind
    @finished ? finish_board : edit_board
    board.show
  end

  def finish_board
    board.finished(round, history, @pretty_final_sequence)
  end

  def edit_board
    board.edit_row(round, history)
  end

  def instructions
    display.instructions
  end

  def valid_input?
    (@guess.length == 4) && (@guess.scan(/[^rgby]/).length == 0)
  end

  def invalid_input(input)
    input == 'q' || input == 'quit' ? return : display.invalid_input(input)
  end

  def game_over
    @finished = true
    update_board
    win? ? display.winner : display.loser
  end

end

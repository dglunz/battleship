require_relative 'game'
require_relative 'display'
require_relative 'board'
require_relative 'player'

class CLI
  attr_reader :input,
              :display,
              :player_1,
              :player_2

  def initialize
    @display  = Display
    @player_2 = Player.new("Bot", Board.new, [])
  end

  def start
    create_first_player
    start_menu
  end

  def start_menu
    display.introduction(player_1.name)
    @input = get_input
    start_menu_options
    play_again? ? start_menu : return
  end

  def start_menu_options
    case
    when play? then play
    when instructions? then instructions
    when quit? then quit
    else display.invalid_input(@input)
    end
  end

  def create_first_player
    display.input_name
    @input = gets.chomp
    @player_1 = Player.new(input, Board.new, [])
  end

  def instructions
    display.instructions
    @input = get_input
    start_menu_options
  end

  def quit
    display.quit
    exit
  end

  def play?
    input == 'p' || input == 'play'
  end

  def instructions?
    input == 'i' || input == 'instructions'
  end

  def quit?
    input == 'q' || input == 'quit'
  end

  def play
    display.start
    @game = Game.new(display, player_1, player_2).start
  end

  def play_again?
    display.play_again
    @input = get_input
    input == 'y' || input == 'yes'
  end

  def get_input
    @input = ''
    display.enter
    @input = gets.chomp.downcase
  end
end

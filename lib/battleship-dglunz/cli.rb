require_relative 'game'
require_relative 'display'
require_relative 'board'
require_relative 'player'

class CLI
  attr_reader :input,
              :display,
              :player_1,
              :player_2,
              :fleet

  def initialize
    @display  = Display
    @fleet    = [
                  patrol_boat = Ship.new("Patrol Boat", 2, "X"),
                  destroyer   = Ship.new("Destroyer", 3, "Y")
                ]
    @player_2 = Player.new("Bot", fleet)

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
    @player_1 = Player.new(input, fleet)
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
    @game = Game.new(display, player_1, player_2, fleet).start
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

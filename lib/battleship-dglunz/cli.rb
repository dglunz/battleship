require_relative 'game'
class CLI
  attr_reader :input,
              :display

  def initialize
    @display = Display

  end

  def start_menu
    display.introduction
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
    @game = Game.new(display).start
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

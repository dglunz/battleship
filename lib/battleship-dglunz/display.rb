require 'rainbow'

class Display
  attr_reader :stdout
  def initialize(stdout)
    @stdout = stdout
  end

  def colorful(sequence)
    sequence.split("").map do |letter|
      color_it(letter)
    end.join("")
  end

  def input_name
    battleship_logo
    stdout.printf "Enter Name: "

  end

  def introduction(name)
    battleship_logo
    stdout.printf "Welcome #{name}!\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n"
  end


  def instructions
    battleship_logo
    stdout.puts "
    \n

    Good luck!\n\n\n\nEnter (p)lay to get started. \n\n"
  end

  def add_ship(ship)
    stdout.printf "#{ship.name} [#{ship.size}]: "
  end

  def target_setup
    stdout.puts "Your turn to attack! Hits are labeled #{Rainbow('H').red} while Misses are labeled #{Rainbow('M').white}"
  end

  def battleship_logo
    clear_screen
    stdout.puts "

██████╗  █████╗ ████████╗████████╗██╗     ███████╗███████╗██╗  ██╗██╗██████╗
██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝██╔════╝██║  ██║██║██╔══██╗
██████╔╝███████║   ██║      ██║   ██║     █████╗  ███████╗███████║██║██████╔╝
██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝  ╚════██║██╔══██║██║██╔═══╝
██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗███████║██║  ██║██║██║
╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝

"

  end

   def clear_screen
     print "\e[2J\e[f"
   end

  def invalid_input(input)
    stdout.puts "#{input} is not a valid input. Please try again."
  end

  def enter
    stdout.printf 'Enter command: '
  end

  def enter_guess
    stdout.printf 'Enter Attack Coordinates: '
  end

  def loser
    stdout.puts 'Sorry, you lose...'
  end

  def winner
    stdout.puts 'Congrats, you win!'
  end

  def hit(ship)
    stdout.puts "You hit the enemy #{ship.name}!"
  end

  def miss
    stdout.puts 'You missed the enemy.'
  end

  def start
    battleship_logo
    stdout.puts "Choose a location for each of the ships in your fleet by choosing coordinates within the Ocean Grid. For example, a ship of length 3 could be: A1 B2 C3 "
  end

  def quit
    stdout.puts "Quitting..."
  end

  def play_again
    stdout.puts "Play Again? (Y)es or (N)o"
  end

end

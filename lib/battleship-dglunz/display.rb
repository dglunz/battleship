require 'rainbow'

module Display
  def self.colorful(sequence)
    sequence.split("").map do |letter|
      color_it(letter)
    end.join("")
  end

  def self.input_name
    battleship_logo
    printf "Enter Name: "

  end

  def self.introduction(name)
    battleship_logo
    printf "Welcome #{name}!\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n"
  end


  def self.instructions
    battleship_logo
    puts "
    \n

    Good luck!\n\n\n\nEnter (p)lay to get started. \n\n"
  end

  def self.add_ship(ship)
    printf "#{ship.name} [#{ship.size}]: "
  end

  def self.target_setup
    puts "Your turn to attack! Hits are labeled #{Rainbow('H').red} while Misses are labeled #{Rainbow('M').white}"
  end

  def self.battleship_logo
    clear_screen
    puts "

██████╗  █████╗ ████████╗████████╗██╗     ███████╗███████╗██╗  ██╗██╗██████╗
██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝██╔════╝██║  ██║██║██╔══██╗
██████╔╝███████║   ██║      ██║   ██║     █████╗  ███████╗███████║██║██████╔╝
██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝  ╚════██║██╔══██║██║██╔═══╝
██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗███████║██║  ██║██║██║
╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝

"

  end

   def self.clear_screen
     print "\e[2J\e[f"
   end

  def self.invalid_input(input)
    puts "#{input} is not a valid input. Please try again."
  end

  def self.enter
    printf 'Enter command: '
  end

  def self.enter_guess
    printf 'Enter Attack Coordinates: '
  end

  def self.loser
    puts 'Sorry, you lose...'
  end

  def self.winner
    puts 'Congrats, you win!'
  end

  def self.start
    battleship_logo
    puts "Choose a location for each of the ships in your fleet by choosing coordinates within the Ocean Grid. For example, a ship of length 3 could be: A1 B2 C3 "
  end

  def self.quit
    puts "Quitting..."
  end

  def self.play_again
    puts "Play Again? (Y)es or (N)o"
  end

end

require 'rainbow'

module Display
  def self.colorful(sequence)
    sequence.split("").map do |letter|
      color_it(letter)
    end.join("")
  end
  def self.introduction
    battleship
    printf "Welcome!\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n"
  end

  def self.instructions
    battleship
    puts "
    \n

    Good luck!\n\n\n\nEnter (p)lay to get started. \n\n"
  end

  def self.battleship
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
    printf 'Enter Guess: '
  end

  def self.loser
    puts 'Sorry, you lose...'
  end

  def self.winner
    puts 'Congrats, you win!'
  end

  def self.start
    battleship
    puts "I have laid out my ships on the grid. Now it's your turn. The first is 2 units long and the second is 3 units long. The grid has A1 at the top left and D4 at the bottom right."
  end

  def self.round_result(results, turn_count)
    puts "'#{results[:guess]}' has #{results[:elements]} of the correct Elements with #{results[:positions]} in the correct Positions.\nYou've taken #{turn_count} guesses"
  end

  def self.quit
    puts "Quitting..."
  end

  def self.play_again
    puts "Play Again? (Y)es or (N)o"
  end

  private

  def self.color_it(letter)
    case letter
      when 'r' then Rainbow(letter).red
      when 'g' then Rainbow(letter).green
      when 'b' then Rainbow(letter).blue
      when 'y' then Rainbow(letter).yellow
      when 'w' then Rainbow(letter).white
      when 'b' then Rainbow(letter).black
      else letter
    end
  end

end

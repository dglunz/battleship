require_relative 'ship'
class Game
  attr_reader :round,
              :history,
              :board,
              :display,
              :coordinates,
              :fleet

  def initialize(display, player_1, player_2, fleet)
    @player_1    = player_1
    @player_2    = player_2
    @round       = 0
    @display     = display
    @board       = Board.new
    @coordinates = ''
    @finished    = false
    @fleet       = fleet
  end

  def start
    board.show_ocean
    ocean_setup
    target_setup
    game_loop
  end

  def game_loop
    until finished?
      get_input
      valid_attack_input? ? play_round : invalid_input(coordinates)
    end
    game_over
  end

  def play_round
    @round += 1
    check_fired_shots
    update_board
    show_round_result
  end

  def ocean_setup
    fleet.each do |ship|
      update_ship_location(ship)
      display.battleship_logo
      board.show_ocean
    end
  end

  def target_setup
    display.battleship_logo
    display.target_setup
    board.show_both
  end

  def update_board
    display.battleship_logo
    # @finished ? finish_board : edit_board
    edit_board
    board.show_both
  end

  def update_ship_location(ship)
    display.add_ship(ship)
    @coordinates = gets.chomp.upcase
    ship.location = coordinates
    board.add_ship(ship)
  end

  def win?

  end

  def quit?
    coordinates == 'Q' || coordinates == 'QUIT'
  end

  def finished?
    # round_limit = 10
    # round >= round_limit ||
     quit? || win?
  end

  def show_round_result(round_result)
    display.round_result(round_result, round)
  end

  def get_input
    display.enter_guess
    @coordinates = gets.chomp.upcase
  end

  def finish_board
    board.finished(round, history)
  end

  def edit_board
    # check if used
    board.edit_row(round, history)
  end

  def valid_attack_input?
    expected_length?(2) && within_column_range? && within_row_range?
  end

  def expected_length?(expected)
    coordinates.length == expected
  end

  def within_row_range?
    coordinates[1].to_i.between?(1,4)
  end

  def within_column_range?
    coordinates[0].scan(/[^ABCD]/).length == 0
  end

  def valid_ship_placement?
    true
  end

  def invalid_input(input)
    quit? ? return : display.invalid_input(input)
  end

  def game_over
    @finished = true
    update_board
    win? ? display.winner : display.loser
  end

end

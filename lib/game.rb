require_relative("player")
require_relative("board")

class Game
  attr_reader :player_one, :player_two, :game_board

  def initialize
    @player_one = Player.new("X", "Player 1")
    @player_two = Player.new("O", "Player 2")
  end

  def play_game
    introduction
    loop do
      @game_board = Board.new
      game_loop
      puts determine_result
      break unless play_again?
    end
  end

  private

  def introduction
    puts <<~HEREDOC
      Welcome to a game of Tic-Tac-Toe!
      Player 1 will use an 'X' symbol and Player 2 will use 'O'.
      Connect 3 symbols to win! Press Enter to continue >>
    HEREDOC
    gets.chomp
  end

  def game_loop
    until game_over?
      play_round(player_one)
      break if game_over?

      play_round(player_two)
    end
  end

  def game_over?
    game_board.win?("X") || game_board.win?("O") || game_board.full_board?
  end

  def determine_result
    if game_board.full_board?
      "This game was a draw."
    elsif game_board.win?("X")
      "Congratulations Player 1! You've won the game"
    else
      "Congratulations Player 2! You've won the game"
    end
  end

  def play_round(player)
    game_board.print_board
    query = "#{player.name}: What is your choice?"
    player_input = player.take_input(query)
    sanitized_input = validate_input(player_input, player)
    game_board.place_token(player.token, sanitized_input)
  end

  def play_again?
    puts "Would you like to play again? Y/n"
    response = gets.chomp.downcase
    response == "y"
  end

  def validate_input(input, player)
    return input if game_board.game_board.flatten.include?(input)

    is_valid = false
    error_query = "Your choice was invalid. Please pick a valid board position."
    correct_input = ""
    until is_valid
      retry_input = player.take_input(error_query)
      is_valid = game_board.game_board.flatten.include?(retry_input)
      correct_input = retry_input
    end
    correct_input
  end
end

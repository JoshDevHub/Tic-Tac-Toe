module TicTacToe
  class CLI
    extend Forwardable

    def initialize(stdin: $stdin, stdout: $stdout, kernel: Kernel)
      @stdin = stdin
      @stdout = stdout
      @kernel = kernel
    end

    def_delegators :@stdout, :puts, :print
    def_delegator :@stdin, :gets
    def_delegator :@kernel, :system

    def run
      system("clear")
      print <<~HEREDOC
        Welcome to a game of Tic-Tac-Toe!
        Player 1 will use an 'X' symbol, and Player 2 will use 'O'.
        Connect 3 symbols to win! Press Enter to continue >>
      HEREDOC
      gets

      players = Array.new(2) do |player_num|
        system("clear")
        puts "Player #{player_num + 1}, what would you like your name to be?"
        input = gets.chomp
        Player.new(Board::SYMBOLS[player_num], input)
      end

      game = Game.new(
        player_one: players.first,
        player_two: players.last,
        board: Board.new
      )

      loop do
        until game.over?
          system("clear")
          puts game.board
          puts "#{game.current_player}, enter the position for your token"
          input = gets.chomp

          game.play_move(input)
          game.swap_players
        end
        system("clear")
        puts game.board
        if game.winner
          puts "Congratulations #{game.winner}! You've won the game."
        else
          puts "This game was a draw."
        end

        print "Would you like to play again? y/n "
        yes_no_input = gets.chomp
        break unless yes_no_input == "y"

        game = Game.new(
          player_one: players.first,
          player_two: players.last,
          board: Board.new
        )
      end

      puts "Thank you for playing"
    end
  end
end

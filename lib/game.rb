require_relative("player")
require_relative("board")

class Game
  attr_reader :current_player

  def initialize(player_one:, player_two:, board:)
    @player_one = player_one
    @player_two = player_two
    @board = board
    @current_player = player_one
  end

  def over?
    @board.win?("X") || @board.win?("O") || @board.full_board?
  end

  def winner
    if @board.win?("X")
      @player_one
    elsif @board.win?("O")
      @player_two
    end
  end

  def swap_players
    @current_player = current_player == @player_one ? @player_two : @player_one
  end
end

# frozen_string_literal: true

require_relative('player')
require_relative('board')

# game.rb
class Game
  def initialize
    @player_one = Player.new('X')
    @player_two = Player.new('O')
    @game_board = Board.new
    @game_over = false
  end

  def play_round(player)
    @game_board.print_board
    player_input = player.sanitize_input.to_i
    @game_board.place_marker(player.marker, player_input)
  end

  def play_game
    until @game_over
      play_round(@player_one)
      @game_over = check_for_win(@game_board.game_board, 'X')
      break if @game_over

      play_round(@player_two)
      @game_over = check_for_win(@game_board.game_board, 'O')
    end
  end

  def check_for_win(nest_array, token)
    check_row_win(nest_array, token) || check_col_win(nest_array, token) ||
      check_first_diagonal_win(nest_array, token) || check_second_diagonal_win(nest_array, token)
  end

  def check_row_win(nest_array, token)
    nest_array.any? do |array|
      array.all? { |element| element == token }
    end
  end

  def check_col_win(nest_array, token)
    nest_array.all? { |array| array[0] == token } ||
      nest_array.all? { |array| array[1] == token } ||
      nest_array.all? { |array| array[2] == token }
  end

  def check_first_diagonal_win(nest_array, token)
    array_to_check = nest_array.flatten
    [array_to_check[0], array_to_check[4], array_to_check[8]].all? do |element|
      element == token
    end
  end

  def check_second_diagonal_win(nest_array, token)
    array_to_check = nest_array.flatten
    [array_to_check[2], array_to_check[4], array_to_check[6]].all? do |element|
      element == token
    end
  end
end

# new_game = Game.new
# p new_game.check_for_win([['X', 2, 'X'], [4, 'X', 6], ['X', 8, 'X']], 'X')

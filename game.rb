# frozen_string_literal: true

require 'pry-byebug'
require_relative('player')
require_relative('board')

# game.rb
class Game
  attr_accessor :winner

  def initialize
    @player_one = Player.new('X', 'Player 1')
    @player_two = Player.new('O', 'Player 2')
    @game_board = Board.new
    @game_over = false
    @winner = nil
  end

  def play_round(player)
    @game_board.print_board
    query = "#{player.name}: What is your choice?"
    player_input = player.take_input(query)
    sanitized_input = validate_input(player_input, player)
    @game_board.place_token(player.token, sanitized_input)
  end

  def play_game
    until @game_over
      play_round(@player_one)
      @player_one.winner = check_for_win('X')
      @game_over = @player_one.winner || @game_board.check_full_board
      break if @game_over

      play_round(@player_two)
      @player_two.winner = check_for_win('O')
      @game_over = @player_two.winner
    end
  end

  def check_for_win(token)
    @game_board.check_row_win(token) || @game_board.check_col_win(token) ||
      @game_board.check_primary_diagonal_win(token) || @game_board.check_secondary_diagonal_win(token)
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

  def validate_input(input, player)
    return input if @game_board.game_board.flatten.include?(input)

    is_valid = false
    error_query = 'Your choice was invalid. Please pick a valid board position.'
    correct_input = ''
    until is_valid
      retry_input = player.take_input(error_query)
      is_valid = @game_board.game_board.flatten.include?(retry_input)
      correct_input = retry_input
    end
    correct_input
  end

  def determine_winner
    @winner = 'Player 1' if @player_one.winner
    @winner = 'Player 2' if @player_two.winner
  end
end

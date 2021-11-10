# frozen_string_literal: true

# board.rb
class Board
  attr_accessor :game_board

  def initialize
    @game_board = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
  end

  def board_search(position)
    row_position = @game_board.index { |array| array.include?(position) }
    col_position = @game_board[row_position].index(position)
    [row_position, col_position]
  end

  def place_token(token, position)
    board_coords = board_search(position)
    @game_board[board_coords[0]][board_coords[1]] = token
  end

  def check_full_board
    @game_board.flatten.all? { |square| %w[X O].include?(square) }
  end

  def get_row_string(row)
    " #{@game_board[row][0]} | #{@game_board[row][1]} | #{@game_board[row][2]}"
  end

  def print_board
    separator = '---+---+---'
    puts
    puts get_row_string(0)
    puts separator
    puts get_row_string(1)
    puts separator
    puts get_row_string(2)
    puts
  end
end

module TicTacToe
  class Board
    attr_accessor :game_board

    def initialize
      @game_board = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
    end

    SYMBOLS = %w[X O].freeze

    def to_s
      separator = "\n---+---+---\n"
      (0..2).map { |idx| get_row_string(idx) }.join(separator)
    end

    def full_board?
      game_board.flatten.all? { |square| SYMBOLS.include?(square) }
    end

    def place_token(token, position)
      x_pos, y_pos = board_search(position)
      game_board[x_pos][y_pos] = token
    end

    def win?(token)
      row_win?(token) || col_win?(token) || main_diagonal_win?(token) ||
        anti_diagonal_win?(token)
    end

    private

    def get_row_string(row)
      " #{game_board[row][0]} | #{game_board[row][1]} | #{game_board[row][2]}"
    end

    def board_search(position)
      row_position = game_board.index { |array| array.include?(position) }
      col_position = game_board[row_position].index(position)
      [row_position, col_position]
    end

    def row_win?(token)
      game_board.any? do |array|
        array.all?(token)
      end
    end

    def col_win?(token)
      game_board.transpose.any? do |array|
        array.all?(token)
      end
    end

    def main_diagonal_win?(token)
      diagonal_map = game_board.map.with_index { |array, index| array[index] }
      diagonal_map.all?(token)
    end

    def anti_diagonal_win?(token)
      diagonal_index = 3
      diagonal_map = game_board.map { |array| array[diagonal_index -= 1] }
      diagonal_map.all?(token)
    end
  end
end

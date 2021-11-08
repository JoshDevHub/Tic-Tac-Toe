# board.rb
class Board
  def initialize
    @game_board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def board_search(position)
    row_position = @game_board.index { |array| array.include?(position) }
    col_position = @game_board[row_position].index(position)
    [row_position, col_position]
  end

  def get_row_string(row)
    " #{@game_board[row][0]} | #{@game_board[row][1]} | #{@game_board[row][2]}"
  end

  def print_board
    separator = '---+---+---'
    puts get_row_string(0)
    puts separator
    puts get_row_string(1)
    puts separator
    puts get_row_string(2)
  end
end

my_board = Board.new
my_board.print_board

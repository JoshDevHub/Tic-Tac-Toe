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
end

my_board = Board.new
p my_board.board_search('X')

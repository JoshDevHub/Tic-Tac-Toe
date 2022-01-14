# frozen_string_literal: true

# spec/board_spec.rb

require './lib/board'

describe Board do
  describe '#check_full_board' do
    subject(:game_board) { Board.new }

    it 'returns false when the game board is empty' do
      expect(game_board.check_full_board).to eq(false)
    end
  end
end

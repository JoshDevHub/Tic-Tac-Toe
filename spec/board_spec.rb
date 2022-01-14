# frozen_string_literal: true

# spec/board_spec.rb

require './lib/board'

describe Board do # rubocop: disable Metrics/BlockLength
  describe '#full_board?' do
    subject(:playing_board) { Board.new }

    it 'returns false when the game board is empty' do
      expect(playing_board.full_board?).to eq(false)
    end

    it 'returns false when some tokens are on the board' do
      partial_board = playing_board.game_board.each { |row| row[0] = 'X' }
      allow(playing_board).to receive(:game_board).and_return(partial_board)
      expect(playing_board.full_board?).to eq(false)
    end

    it 'returns true when the board is full of tokens' do
      full_board = playing_board.game_board.map { |row| row.map { |_square| 'X' } }
      allow(playing_board).to receive(:game_board).and_return(full_board)
      expect(playing_board.full_board?).to eq(true)
    end
  end

  describe '#place_token' do
    subject(:playing_board) { Board.new }
    xit 'sends board_search to self and returns a board position' do

    end

    context 'places tokens on the board' do
      before do
        allow(playing_board).to receive(:board_search).and_return([0, 0])
      end

      it "changes the requested element in the board to 'X'" do
        token = 'X'
        position = [0, 0]
        expect { playing_board.place_token(token, position) }.to change { playing_board.game_board[0][0] }.to(token)
      end

      it "changes the requested element in the boat to 'O'" do
        token = '0'
        position = [0, 0]
        expect { playing_board.place_token(token, position) }.to change { playing_board.game_board[0][0] }.to(token)
      end
    end
  end
end

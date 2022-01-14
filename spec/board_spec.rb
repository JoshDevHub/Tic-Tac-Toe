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

  describe '#place_token' do # rubocop: disable Metrics/BlockLength
    subject(:playing_board) { Board.new }

    context 'places a token on the first position on the board' do
      position = 1
      before do
        allow(playing_board).to receive(:board_search).with(position).and_return([0, 0])
      end

      it "changes the element in the board at [0][0] to 'X'" do
        token = 'X'
        expect { playing_board.place_token(token, position) }.to change { playing_board.game_board[0][0] }.to(token)
      end

      it "changes the element in the board at [0][0] to 'O'" do
        token = '0'
        expect { playing_board.place_token(token, position) }.to change { playing_board.game_board[0][0] }.to(token)
      end
    end

    context 'places a token in the middle of the board' do
      position = 5
      before do
        allow(playing_board).to receive(:board_search).with(position).and_return([1, 1])
      end

      it "changes the element in the board at [1][1] to 'X'" do
        token = 'X'
        expect { playing_board.place_token(token, position) }.to change { playing_board.game_board[1][1] }.to(token)
      end

      it "changes the element in the board at [1][1] to 'O'" do
        token = 'O'
        expect { playing_board.place_token(token, position) }.to change { playing_board.game_board[1][1] }.to(token)
      end
    end
  end
end

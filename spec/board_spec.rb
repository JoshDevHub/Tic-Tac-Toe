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
      partial_board = playing_board.game_board.each { |row| row[0] = 'X' } # TODO: better intention
      allow(playing_board).to receive(:game_board).and_return(partial_board)
      expect(playing_board.full_board?).to eq(false)
    end

    it 'returns true when the board is full of tokens' do
      full_board = playing_board.game_board.map { |row| row.map { |_square| 'X' } } # TODO: better intention
      allow(playing_board).to receive(:game_board).and_return(full_board)
      expect(playing_board.full_board?).to eq(true)
    end
  end

  describe '#place_token' do # rubocop: disable Metrics/BlockLength
    subject(:playing_board) { Board.new }

    it 'sends board_search to self containing position 1 and return board coordinates [0, 0]' do
      position = 1
      token = 'X'
      expected_coordinates = [0, 0]
      expect(playing_board).to receive(:board_search).with(position).and_return(expected_coordinates)
      playing_board.place_token(token, position)
    end

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

  describe '#win?' do # rubocop: disable Metrics/BlockLength
    subject(:playing_board) { Board.new }
    context 'when no win condition has been met' do
      it 'returns false when the board is empty' do
        token = 'X'
        expect(playing_board.win?(token)).to be(false)
      end
      it 'returns false when the board is full with no tokens forming a row' do
        drawn_board = [
          %w[X O O],
          %w[O X X],
          %w[O X O]
        ]
        token = 'O'
        allow(playing_board).to receive(:game_board).and_return(drawn_board)
        expect(playing_board.win?(token)).to be(false)
      end
      it 'returns false with a partially full board and no tokens forming a row' do
        partial_board = [
          %w[X 0 0],
          %w[4 X 6],
          %w[7 8 9]
        ]
        token = 'X'
        allow(playing_board).to receive(:game_board).and_return(partial_board)
        expect(playing_board.win?(token)).to be(false)
      end
    end
    context 'when a win condition has been met' do
      it 'returns true when a row is filled with the same token' do
        row_win_board = [
          %w[0 O O],
          %w[X X X],
          %w[7 8 9]
        ]
        token = 'X'
        allow(playing_board).to receive(:game_board).and_return(row_win_board)
        expect(playing_board.win?(token)).to be(true)
      end
      xit 'returns true when a column is filled with the same token' do
        # placeholder
      end
      xit 'returns true when the main diagonal is filled with the same token' do
        # placeholder
      end
      xit 'returns true when the anti diagonal is filled with the same token' do
        # placeholder
      end
    end
  end
end

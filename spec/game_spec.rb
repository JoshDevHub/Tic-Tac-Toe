# frozen_string_literal: true

# spec/game_spec.rb

require './lib/game'

describe Game do
  subject(:tic_tac_toe) { described_class.new }
  describe '#play_game' do
    context 'when players play two games' do
      before do
        allow(tic_tac_toe).to receive(:game_over?).and_return(true)
        allow(tic_tac_toe).to receive(:play_again?).and_return(true, false)
      end

      it 'calls game_loop twice' do
        expect(tic_tac_toe).to receive(:game_loop).twice
        tic_tac_toe.play_game
      end
    end

    context 'when players play five games' do
      before do
        allow(tic_tac_toe).to receive(:game_over?).and_return(true)
        allow(tic_tac_toe).to receive(:play_again?).and_return(true, true, true, true, false)
      end

      it 'calls game_loop five times' do
        expect(tic_tac_toe).to receive(:game_loop).exactly(5).times
        tic_tac_toe.play_game
      end
    end
  end
end

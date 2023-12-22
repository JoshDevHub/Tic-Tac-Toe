require "./lib/game"

describe Game do
  subject(:tic_tac_toe) { described_class.new(board:, player_two:, player_one:) }

  let(:player_one) { instance_double(Player) }
  let(:player_two) { instance_double(Player) }
  let(:board) { instance_double(Board, full_board?: false, win?: false) }

  describe "#over?" do
    context "when the board returns false for full_board? and win?" do
      it "is not over" do
        expect(tic_tac_toe).not_to be_over
      end
    end

    context "when the board returns true for a `#full_board?`" do
      before do
        allow(board).to receive(:full_board?).and_return true
      end

      it "is over" do
        expect(tic_tac_toe).to be_over
      end
    end

    context "when the board returns true for a `#win?`" do
      before do
        allow(board).to receive(:win?).and_return true
      end

      it "is over" do
        expect(tic_tac_toe).to be_over
      end
    end
  end
end

require_relative "../../lib/tic_tac_toe"

describe TicTacToe::Game do
  subject(:tic_tac_toe) { described_class.new(board:, player_two:, player_one:) }

  let(:player_one) { instance_double(TicTacToe::Player, token: "X") }
  let(:player_two) { instance_double(TicTacToe::Player, token: "O") }
  let(:board) { instance_double(TicTacToe::Board, full_board?: false, win?: false) }

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

  describe "#winner" do
    context "when there is no winner" do
      it "returns `nil`" do
        expect(tic_tac_toe.winner).to be_nil
      end
    end

    context "when player_one is the winner" do
      before do
        allow(board).to receive(:win?).with("X").and_return true
      end

      it "returns player_one" do
        expect(tic_tac_toe.winner).to eq player_one
      end
    end

    context "when player_two is the winner" do
      before do
        allow(board).to receive(:win?).with("O").and_return true
      end

      it "returns player_two" do
        expect(tic_tac_toe.winner).to eq player_two
      end
    end
  end

  describe "#current_player" do
    context "when the current_player is player_one" do
      it "changes the current player to player_two" do
        expect { tic_tac_toe.swap_players }
          .to change(tic_tac_toe, :current_player).from(player_one).to(player_two)
      end
    end

    context "when the current_player is player_two" do
      before { tic_tac_toe.swap_players }

      it "changes the current player to player_one" do
        expect { tic_tac_toe.swap_players }
          .to change(tic_tac_toe, :current_player).from(player_two).to(player_one)
      end
    end
  end

  describe "#play_move" do
    before do
      allow(board).to receive(:place_token)
    end

    it "sends the `#place_token` message to the board with current player's token and given position" do
      position = "7"
      current_token = tic_tac_toe.current_player.token

      tic_tac_toe.play_move(position)

      expect(board).to have_received(:place_token).with(current_token, position)
    end
  end

  describe "#board" do
    before do
      allow(board).to receive(:to_s)
    end

    it "sends a `#to_s` message to the board" do
      tic_tac_toe.board
      expect(board).to have_received(:to_s)
    end
  end
end

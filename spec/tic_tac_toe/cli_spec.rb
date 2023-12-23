require_relative "../../lib/tic_tac_toe"

def record_inputs(*input_list)
  inputs = StringIO.new(input_list.join("\n"))
  inputs.close_write

  inputs
end

describe TicTacToe::CLI do
  subject(:cli_game) { described_class.new(stdin: fake_stdio, kernel:, stdout:) }

  let(:kernel) { double("Kernel", system: nil) }
  let(:stdout) { StringIO.new }

  before { cli_game.run }

  context "when the inputs lead to a game where Player 1 wins" do
    let(:fake_stdio) do
      record_inputs("", "Player 1", "Player 2", "1", "3", "5", "2", "9", "n")
    end

    it "outputs a message for Player 1 winning the game" do
      expected_message = "Congratulations Player 1! You've won the game."
      expect(stdout.string).to include(expected_message)
    end
  end

  context "when the inputs lead to a game where Player 2 wins" do
    let(:fake_stdio) do
      record_inputs("", "Player 1", "Player 2", "1", "2", "3", "5", "4", "8", "n")
    end

    it "outputs a message for Player 2 winning the game" do
      expected_message = "Congratulations Player 2! You've won the game."
      expect(stdout.string).to include(expected_message)
    end
  end
end

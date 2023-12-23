module TicTacToe
  class Player
    attr_reader :token, :name
    alias to_s name

    def initialize(token, name)
      @name = name
      @token = token
    end
  end
end

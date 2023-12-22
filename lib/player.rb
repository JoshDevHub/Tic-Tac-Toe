class Player
  attr_reader :token, :name

  def initialize(token, name)
    @name = name
    @token = token
  end

  def take_input(query)
    puts query
    gets.chomp
  end
end

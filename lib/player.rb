# frozen_string_literal: true

# player.rb
class Player
  attr_reader :token, :name
  attr_accessor :winner

  def initialize(token, name)
    @name = name
    @token = token
    @winner = false
  end

  def take_input(query)
    puts query
    gets.chomp
  end
end
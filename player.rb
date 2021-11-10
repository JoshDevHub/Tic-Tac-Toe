# frozen_string_literal: true

# player.rb
class Player
  attr_reader :marker, :name
  attr_accessor :winner

  def initialize(marker, name)
    @name = name
    @marker = marker
    @winner = false
  end

  def take_input(query)
    puts query
    gets.chomp
  end
end

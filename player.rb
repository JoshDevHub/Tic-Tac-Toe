# frozen_string_literal: true

# player.rb
class Player
  attr_reader :marker, :error_query, :name
  attr_accessor :winner

  def initialize(marker, name)
    @name = name
    @marker = marker
    @error_query = 'Your choice was invalid. Please pick a valid board position.'
    @winner = false
  end

  def take_input(query)
    puts query
    gets.chomp
  end
end

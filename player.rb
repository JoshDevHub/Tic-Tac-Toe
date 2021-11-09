# frozen_string_literal: true

# player.rb
class Player
  attr_reader :marker, :error_query

  def initialize(marker)
    @marker = marker
    @default_query = 'What is your choice?'
    @error_query = 'Your choice was invalid. Please pick a valid board position.'
  end

  def take_input(query = @default_query)
    puts query
    gets.chomp
  end
end

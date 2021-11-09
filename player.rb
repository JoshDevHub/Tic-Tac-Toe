# frozen_string_literal: true

# player.rb
class Player
  attr_reader :default_query, :error_query

  def initialize
    @default_query = 'What is your choice?'
    @error_query = 'Your choice was invalid. Please pick a valid board position.'
  end

  def take_input(query = @default_query)
    puts query
    gets.chomp
  end

  def valid_number?(number)
    number == number.to_i.to_s && number.to_i.between?(1, 9)
  end

  def sanitize_input
    input = take_input
    return input if valid_number?(input)

    san_input = false
    until san_input
      input = take_input(@error_query)
      san_input = valid_number?(input)
      input
    end
  end
end

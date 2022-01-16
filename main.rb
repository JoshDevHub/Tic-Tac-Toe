# frozen_string_literal: true

require_relative('lib/game')

loop do
  new_game = Game.new
  puts 'Welcome to my Tic-Tac-Toe game!'
  puts "Player 1 will use 'X'. Player 2 will use 'O'."
  puts 'Connect 3 symbols to win! Press enter to continue >>'
  gets.chomp
  new_game.play_game
  puts 'Would you like to play again? Y/n'
  answer = gets.chomp.downcase
  break unless answer == 'y'
end

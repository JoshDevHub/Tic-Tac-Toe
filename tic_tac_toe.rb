# frozen_string_literal: true

require_relative('game')

loop do
  new_game = Game.new
  puts 'Welcome to my Tic-Tac-Toe game!'
  puts "Player 1 will use 'X'. Player 2 will 'O'."
  puts 'Connect 3 symbols to win! Press enter to continue >>'
  gets.chomp
  new_game.play_game
  new_game.determine_winner
  case new_game.winner
  when 'Player 1'
    puts "Congratulations Player 1! You've won the game"
  when 'Player 2'
    puts "Congratulations Plyaer 2! You've won the game"
  else
    puts 'This game was a draw'
  end
  puts 'Would you like to play again? Y/n'
  answer = gets.chomp.downcase
  break unless answer == 'y'
end

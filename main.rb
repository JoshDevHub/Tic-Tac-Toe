# frozen_string_literal: true

require_relative('game')

loop do
  new_game = Game.new
  puts 'Welcome to my Tic-Tac-Toe game!'
  puts "Player 1 will use 'X'. Player 2 will 'O'."
  puts 'Connect 3 symbols to win! Press any key to continue >>'
  $stdin.getch
  new_game.play_game
  new_game.determine_winner
  case new_game.winner
  when 'Player 1'
    puts 'Congratulations Player 1!'
  when 'Player 2'
    puts 'Congratulations Player 2!'
  else
    puts 'This game was a draw'
  end
  puts 'Would you like to play again? Y/n'
  answer = gets.chomp.downcase
  break unless answer == 'y'
end

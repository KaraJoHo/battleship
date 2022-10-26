require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'
puts "enter username: \nOr enter exit to quit the game"
exit_input = gets.chomp
until exit_input == 'exit'
game = Game.new
game.start_menu
game.computer_board
game.user_board 
game.turn
game.ending_statement
end 
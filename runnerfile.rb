require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'

game = Game.new
game .start_menu
game.computer_board
game.user_board 
game.turn
game.ending_statement
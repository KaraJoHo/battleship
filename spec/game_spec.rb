require 'rspec'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'

RSpec.describe Game do
    describe '#initialize' do
        it 'will test to see if possible placements have been generated' do
        game = Game.new
        computers_board = Board.new
          game.computers_board
        expect(game).to be_a(Game)
        end
    end

    describe '#user_board' do
      it 'users the boardajskfbnjgf' do
        game = Game.new
        users_board = Board.new
        game.user_board
      end
    end
    describe '#turn' do
      it 'users the boardajskfbnjgf' do
        game = Game.new
        users_board = Board.new
        computers_board = Board.new
        game.user_board
        game.computer_board
        game.turn
      end
    end

end

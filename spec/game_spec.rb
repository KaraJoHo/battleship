require 'rspec'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'

RSpec.describe Game do
    describe '#initialize' do
        it 'will test to see if possible placements have been generated' do
        game = Game.new
        computer_board = Board.new
          game.computer_board
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
end

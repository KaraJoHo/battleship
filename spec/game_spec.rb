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
        expect(game).to be_a(Game)
        end 
    end 
end 

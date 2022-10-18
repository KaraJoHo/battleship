require 'rspec'
require './lib/cell'
require './lib/ship'
require './lib/board'

RSpec.describe do
    describe '#initialize' do 
        it 'will be an instance of Board' do 
            board = Board.new
            expect(board).to be_a(Board)
        end 

        it 'will create hash with cell name and object stored in it' do
            board = Board.new

            expect(board.cells.class).to eq(Hash)

            expect(board.cells.keys.count).to eq(16)

            # expect(board.cells.cell_1).to be_a(Cell)
        
        end 

    end 
end  
        

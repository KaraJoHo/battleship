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

    describe '#validate_coordinate?' do
        it 'will tell us if the coordinate has a valid spot on the board' do 
            board = Board.new
            expect(board.validate_coordinate?("A1")).to eq(true)

            expect(board.validate_coordinate?("A5")).to eq(false)
        end 
    end

    describe '#valid_placement?' do
        it 'will tell us if the coordinates inputted are a valid placement for a ship' do
            board = Board.new
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)
            
            expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
            expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
        end

        it 'will check to see if coords are in consecutive order' do 
            board = Board.new
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)
            

            expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
        end 
            

    end

end  
        
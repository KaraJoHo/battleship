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


            expect(board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)
            expect(board.valid_placement?(submarine, ["C2", "D1"])).to eq(false)
            expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
            expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
            expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
            expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)

        end


    end
    describe '#place' do
      it 'places a ship on the board' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        cell_1 = board.cells["A1"]
        cell_2 = board.cells["A2"]
        cell_3 = board.cells["A3"]
        board.place(cruiser, ["A1", "A2", "A3"])

        require 'pry' ;binding.pry
        expect(cell_3.empty?).to eq(false)
      end
    end

end

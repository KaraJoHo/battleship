require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe do
  describe '#initialize' do
    it 'checks for tan instance of the cell class' do
      cell = Cell.new("B4")
      expect(cell).to be_a(Cell)
      #require 'pry' ;binding.pry
    end
    it 'will check if there is a ship in the cell' do
      cell = Cell.new("B4")

      expect(cell.ship).to eq(nil)
    end
    it 'will check to see if the cell is empty' do
      cell = Cell.new("B4")
      expect(cell.empty?). to eq(true)
    end
  end
end

require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe do
  describe '#initialize' do
    it 'checks for tan instance of the cell class' do
      cell = Cell.new("B4")
      expect(cell).to be_a(Cell)

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

  describe '#place_ship' do
    it 'will place a ship on the cell' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)

      expect(cell.ship).to eq(cruiser)
      #require 'pry' ;binding.pry
    end
  end

  describe '#fired_upon?' do
    it 'will return true or false if the ship was fired upon' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)

      expect(cell.fired_upon?).to eq(false)
    end
  end

  describe '#fire_upon' do
    it 'will reduce the cell health by 1' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      cell.fire_upon
      expect(cell.ship.health).to eq(2)

    end
  end

  describe '#render' do
    it 'assign the cell hit or miss strings' do
      cell_1 = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)

    
      expect(cell_1.render).to eq(".")
      cell_1.place_ship(cruiser)
      expect(cell_1.render).to eq(".")

      
    end

    it 'will render hit' do 
      cell_1 = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell_1.place_ship(cruiser)

      expect(cell_1.render).to eq(".")
      cell_1.fire_upon
      expect(cell_1.render).to eq("H")
    end 

    it 'will render sunk' do 
      cell_1 = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell_1.place_ship(cruiser)
      cruiser.hit
      cruiser.hit
      cruiser.hit

      expect(cell_1.render).to eq("X")
  
    end 

    it 'will render miss on empty cell' do 
      cell_1 = Cell.new("B4")
      cell_1.fire_upon

      expect(cell_1.render).to eq("M")
    end 

    it 'will render show' do
      cell_1 = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell_1.place_ship(cruiser)

      expect(cell_1.render(true)).to eq("S")
      
    end 

  end
end

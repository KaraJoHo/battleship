require 'rspec'
require './lib/ship'

RSpec.describe Ship do
  describe '#initialize' do
    it 'will be an instance of the Ship class' do

      cruiser = Ship.new("Cruiser", 3)

      #require 'pry' ;binding.pry

      expect(cruiser).to be_a(Ship)

    end
    it 'will check to see if the ship object has a name' do
      cruiser = Ship.new("Cruiser", 3)
      expect("Cruiser").to eq(cruiser.name)
    end
    it 'will check to verify the ship object length' do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser.length).to eq(3)
    end
  end

  describe '#health' do
    it 'will check to see if the ship object health is the same as its length' do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser.health).to eq(cruiser.length)
    end
  end

  describe '#sunk?' do
    it 'will return true or false if the ship has sunk' do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser.sunk?).to eq(false)
    end
  end

  describe '#hit' do
    it 'will lower the ships health if hit' do
      cruiser = Ship.new("Cruiser", 3)
      
      cruiser.hit
      expect(cruiser.health).to eq(2)
    end
  end
end

require 'rspec'
require './lib/ship'

RSpec.describe Ship do
  describe '#initialize' do
    it 'will be an instance of the Ship class' do

      cruiser = Ship.new("Cruiser", 3)

      #require 'pry' ;binding.pry

      expect(cruiser).to be_a(Ship)

    end

  end

end

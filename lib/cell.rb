

class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty?
    if ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship_placed)
    @ship = ship_placed
  end
end



class Cell
  attr_reader :coordinate, :ship, :cell_health
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @cell_health = 1
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

  def fired_upon?
    if @cell_health == 1
      false
    else
      true
    end
  end

  def fire_upon
    if @ship.hit || empty?
      @cell_health -= 1
      #returns 0 in pry
    end
  end
end

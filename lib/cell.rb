

class Cell
  attr_reader :coordinate, :ship, :cell_health, :xcoordinate, :ycoordinate
  def initialize(coordinate)
    @coordinate = coordinate

    @ship = nil
    @cell_health = 1
  end

  def empty?
    if @ship == nil
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
    if empty? || @ship.hit
      @cell_health -= 1
      #returns 0 in pry
    end
  end

  def render
    if empty? == true && @cell_health == 1
      "."
    elsif empty? == false && @cell_health == 1
      "S"
    elsif empty? == true && @cell_health == 0
      "M"
    elsif @ship.hit == true
      "H"
    elsif @ship.sunk? == true
      "X"
    end
  end
end

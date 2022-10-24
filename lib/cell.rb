

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
    if empty? == true
      @cell_health -= 1
    else
     @ship.hit
     @cell_health -= 1
   end
  end

  def render

    if empty? == true && @cell_health == 1
      "."
      elsif empty? == true && @cell_health == 0
        "M"
      elsif empty? == false && @ship.sunk? == true
        "X"
      elsif empty? == false && @cell_health == 0
        "H"
      elsif empty? == false
        "S"
    end
  end
end

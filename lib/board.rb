class Board
  attr_reader :cells, :range_array_x, :x_coord_range_array
  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
      }

  end

  def validate_coordinate?(coordinate)
    if @cells.include?(coordinate)
      true
    else
      false
    end
  end

  def valid_placement?(ship, coordinates)
    range_array_y = ("A".."D").to_a

    range_array_x = ("1".."4").to_a

    xcoordinates = coordinates.map do|coord|
      coord.chars()[1]
    end

    ycoordinates = coordinates.map do|coord|
      coord.chars()[0]
    end

    valid_range_x = []
    valid_range_y = []
    ("1".."4").each_cons(ship.length) { |range_array_x| valid_range_x << range_array_x }
    ("A".."D").each_cons(ship.length) { |range_array_y| valid_range_y << range_array_y}

    all_letters_same = []
    ycoordinates.all? { |letter| if letter == ycoordinates[0]
      all_letters_same << letter end }

    all_numbers_same = []
    xcoordinates.all? { |num| if num == xcoordinates[0]
      all_numbers_same << num end }

    cell_empty_in_board = coordinates.map do |coordinate|
      cells[coordinate].empty?
    end

    if ship.length == coordinates.length && cell_empty_in_board.all? {|bool| bool == true}
      valid_range_x.include?(xcoordinates) || valid_range_y.include?(ycoordinates)
      all_letters_same.length == ship.length || all_numbers_same.length == ship.length

    else
      false
    end
  end


  def place(ship, coordinates)

    if valid_placement?(ship, coordinates) == true

      coordinates.each do |element|
        cells[element].place_ship(ship)
      end
    end
  end

  def render(arg = false)

    "  1 2 3 4 \n" +
    "A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} \n" +
    "B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \n" +
    "C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \n" +
    "D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} \n"

  end
end

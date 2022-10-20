class Board
    attr_reader :cells, :range_array_x, :x_coord_range_array
    def initialize 
        @cells = {
            "A1" => cell_1 = Cell.new("A1"),
            "A2" => cell_2 = Cell.new("A2"),
            "A3" => cell_3 = Cell.new("A3"),
            "A4" => cell_4 = Cell.new("A4"),
            "B1" => cell_5 = Cell.new("B1"),
            "B2" => cell_6 = Cell.new("B2"),
            "B3" => cell_7 = Cell.new("B3"),
            "B4" => cell_8 = Cell.new("B4"),
            "C1" => cell_9 = Cell.new("C1"),
            "C2" => cell_10 = Cell.new("C2"),
            "C3" => cell_11 = Cell.new("C3"),
            "C4" => cell_12 = Cell.new("C4"),
            "D1" => cell_13 = Cell.new("D1"),
            "D2" => cell_14 = Cell.new("D2"),
            "D3" => cell_15 = Cell.new("D3"),
            "D4" => cell_16 = Cell.new("D4")
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
        # range_array_y = cells.keys.to_a
        # range_array_y.map do|coord|
        #     coord.chars()[0]
        #     # require 'pry'; binding.pry
        # end 
        # @range_array_x = @cells.keys.to_a
        # @x_coord_range_array = @range_array_x.map do|coord|
        #     coord.chars()[1]
        # end 
        
        xcoordinate = coordinates.map do|coord|
            coord.chars()[1]
            # require 'pry'; binding.pry

        end 
        ycoordinate = coordinates.map do|coord|
            coord.chars()[0]
        end 
       
        valid_range_x = []
        valid_range_y = []
        valid_x = (1..4).each_cons(ship.length) { |range_array_x| valid_range_x << valid_x } 
        valid_y = ("A".."D").each_cons(ship.length) {|range_array_y| valid_range_y << valid_x}
        

        if ship.length == coordinates.length 
        
            xcoordinate == valid_range_x[0] || valid_range_x[1]
            ycoordinate == valid_range_y[0] || valid_range_y[1]

          true

         else 
            false
         end 
    end 



    

end 
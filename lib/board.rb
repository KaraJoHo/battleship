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
          #cell_empty_in_board.all? {|bool| bool == true}

        # require 'pry'; binding.pry
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

    def render


        "  1 2 3 4 \n" +
        "A . . . . \n" +
        "B . . . . \n" +
        "C . . . . \n" +
        "D . . . . \n"

        cell_values = cells.values
        cell_rendered = cell_values.map do |cell|
          cell.render
        end
        #ehh? = [["  1 2 3 4 \n"], ["A #{cell_rendered} \n"], ["B . . . . \n"], ["C . . . . \n"], ["D . . . . \n"]]
          # 4 different array w/ cell rendeered for each row
          # have the row start with letter automatically
          #array w/ each row cell being rendered and add together
          #string interpolate...we need arrays
          # A #{array_name}.to_s

        # rows_array = []
        # rows = ("A".."D").each_cons(1) {|row| rows_array << row}
        # row_render = rows_array.each_slice(1).map{ |row| row.join(" ")}.join("\n")
        # final_render = cell_rendered.each_slice(4).map{ |cell| cell.join(" ")} #.join("\n#{rows}")

        #row_render.to_s + final_render.to_s

        #{}" 1 2 3 4 \n#{final_render}"

        # grid = [[ 1, 2, 3, 4 ],
        #         [A, ., ., ., .],
        #         [B, ., ., ., .],
        #         [C, ., ., ., .],
        #         [D, ., ., ., .]]
        #     g1 = [0]
        #     g2 = [0][0]
        #     g1.join(" ")
        #     g1.unshift(g2)
        #
        #     grid.shift
        #     grid.each do |g|
        #       g2 = g[0]
        #       g.shift
        #       g.join(" ")
        #       g.unshift(g2)
        #     end





        # "A \n B \n C \n D"

         # "  1 2 3 4 \n" +
         # "A . . . . \n" +
         # "B . . . . \n" +
         # "C . . . . \n" +
         # "D . . . . \n"
        #we want to place the ship on the board
        #show the placement with the "S" to representthat there us a ship
    end

end

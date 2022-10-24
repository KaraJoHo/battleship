class Game
    attr_reader :computer_board

    def computer_board
        computer_board = Board.new
        computer_cruiser = Ship.new("Cruiser", 3)
        computer_submarine = Ship.new("Submarine", 2)
        computer_ships = [computer_cruiser, computer_submarine]
       
        computer_ships.each do |ship|
        range = computer_board.cells.keys
        popped_coords = range.sample(ship.length)
      

          until computer_board.valid_placement?(ship, popped_coords) 
                popped_coords = range.sample(ship.length)
                    #  require 'pry'; binding.pry
                end 
                computer_board.place(ship, popped_coords)


 
        end   

    end 
end 
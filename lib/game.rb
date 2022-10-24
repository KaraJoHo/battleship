class Game
  attr_reader :computer_board, :users_board

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
      end
        computer_board.place(ship, popped_coords)
    end

  end

  def user_board
    users_board = Board.new
    user_cruiser = Ship.new("Cruiser", 3)
    user_submarine = Ship.new("Submarine", 2)
    user_ships = [user_cruiser, user_submarine]

    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships.
    The Cruiser is three units long and the Submarine is two units long."

    puts users_board.render

    puts "Enter the squares for the cruiser (3 spaces)"

    input_coords = gets.chomp
    user_coords = input_coords.split


    if users_board.valid_placement?(user_cruiser, user_coords)
      users_board.place(user_cruiser, user_coords)
      puts users_board.render

    else
      until users_board.valid_placement?(user_cruiser, user_coords)
        puts "Those are invalid coordinates. Try again"
        puts "Enter the squares for the cruiser (3 spaces)"
        input_coords = gets.chomp
        user_coords = input_coords.split
      end
      users_board.place(user_cruiser, user_coords)
      puts users_board.render
    end



    puts "Enter the squares for the submarine (2 spaces)"

    input_coords = gets.chomp
    user_coords = input_coords.split


    if users_board.valid_placement?(user_submarine, user_coords)
      users_board.place(user_submarine, user_coords)
      puts users_board.render

    else
      until users_board.valid_placement?(user_submarine, user_coords)
        puts "Those are invalid coordinates. Try again"
        puts "Enter the squares for the submarine (2 spaces)"
        input_coords = gets.chomp
        user_coords = input_coords.split
      end
      users_board.place(user_submarine, user_coords)
      puts users_board.render
    end
  end

end

class Game
  attr_reader :computers_board, :users_board, :computer_ships, :user_ships, :user_cruiser, :user_submarine, :computer_cruiser, :computer_submarine

  def computer_board
    @computers_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @computer_ships = [computer_cruiser, computer_submarine]

    computer_ships.each do |ship|
    range = computers_board.cells.keys
    popped_coords = range.sample(ship.length)


      until computers_board.valid_placement?(ship, popped_coords)
        popped_coords = range.sample(ship.length)
      end
        computers_board.place(ship, popped_coords)
    end

  end

  def start_menu
    puts "\n =============Welcome to Battleship!============= \n \n" 
    puts  "Press P to play of Q to quit"

    menu_prompt = gets.chomp
    if menu_prompt.downcase == 'p'

    else 
      until menu_prompt.downcase == 'p' 
        puts "\nGoodbye. \n"
        puts "\n =============Welcome to Battleship!============= \n \n" + "Press P to play of Q to quit"
        menu_prompt = gets.chomp
      end 
    end 
  end 
        

  def user_board
    @users_board = Board.new
    @user_cruiser = Ship.new("Cruiser", 3)
    @user_submarine = Ship.new("Submarine", 2)
    @user_ships = [user_cruiser, user_submarine]
     
    puts "Starting Game"
    puts "============="
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long. \n \n"
    puts "==============PLAYER BOARD=============="
    puts users_board.render(true)

    puts "Enter the squares for the cruiser (3 spaces) \n\n"

    input_coords = gets.chomp
    user_coords = input_coords.split


    if users_board.valid_placement?(user_cruiser, user_coords)
      users_board.place(user_cruiser, user_coords)
      puts users_board.render(true)

    else
      until users_board.valid_placement?(user_cruiser, user_coords)
        puts "Those are invalid coordinates. Try again \n"
        puts "Enter the squares for the cruiser (3 spaces)"
        input_coords = gets.chomp
        user_coords = input_coords.split
      end
      users_board.place(user_cruiser, user_coords)
      puts users_board.render(true)
    end



    puts " Enter the squares for the submarine (2 spaces)"

    input_coords = gets.chomp
    user_coords = input_coords.split


    if users_board.valid_placement?(user_submarine, user_coords)
      users_board.place(user_submarine, user_coords)
      puts users_board.render(true)

    else
      until users_board.valid_placement?(user_submarine, user_coords)
        puts "Those are invalid coordinates. Try again \n"
        puts "Enter the squares for the submarine (2 spaces)"
        input_coords = gets.chomp
        user_coords = input_coords.split
      end
      users_board.place(user_submarine, user_coords)
      puts users_board.render(true)
    end
  end

  def turn
    puts "Let's start sinking ships!! \n\n"
    puts "=============COMPUTER BOARD============="
    puts computers_board.render

    puts "==============PLAYER BOARD=============="
    puts users_board.render(true)

    # USER SHOT

    until computer_submarine.sunk? == true && computer_cruiser.sunk? == true || user_submarine.sunk? == true && user_cruiser.sunk? == true


      puts "Enter the coordinate of your shot! \n"
      user_coord_input = gets.chomp

      if computers_board.validate_coordinate?(user_coord_input) == true && computers_board.cells[user_coord_input].fired_upon? == false

          computers_board.cells[user_coord_input].fire_upon

        else
          until computers_board.validate_coordinate?(user_coord_input) == true && computers_board.cells[user_coord_input].fired_upon? == false
            puts "That is an invalid coordinate, please try again!"
            puts "Enter the coordinate for your shot"
            user_coord_input = gets.chomp
          end

          computers_board.cells[user_coord_input].fire_upon

        end

    # COMPUTER SHOT


    cell_range = users_board.cells.keys
    cell_range_array = cell_range.sample(1).join

    if users_board.cells[cell_range_array].fired_upon? == false
       users_board.cells[cell_range_array].fire_upon
    else
      until users_board.cells[cell_range_array].fired_upon? == false
        cell_range_array = cell_range.sample(1).join
      end
        users_board.cells[cell_range_array].fire_upon
    end



    #RESULTS

    puts "=============COMPUTER BOARD============="
    puts computers_board.render

    puts "==============PLAYER BOARD=============="
    puts users_board.render(true)

    if  computers_board.cells[user_coord_input].render == "H"
      puts "Your shot on #{user_coord_input} was a hit."
      elsif computers_board.cells[user_coord_input].render == "M"
        puts "Your shot on #{user_coord_input} was a miss."
      else computers_board.cells[user_coord_input].render == "X"
        puts "Your shot on #{user_coord_input} sunk my ship!"
    end


    if  users_board.cells[cell_range_array].render == "H"
      puts "My shot on #{cell_range_array} was a hit. \n"
      elsif users_board.cells[cell_range_array].render == "M"
        puts "My shot on #{cell_range_array} was a miss. \n"
      else users_board.cells[cell_range_array].render == "X"
        puts "My shot on #{cell_range_array} sunk your ship! \n"
    end

   end

   if computer_submarine.sunk? == true && computer_cruiser.sunk? == true
    puts "====================================="
    puts "You won!"

    else user_submarine.sunk? == true && user_cruiser.sunk? == true
      puts "==================================== "
      puts "I won!"
   end

  end

end

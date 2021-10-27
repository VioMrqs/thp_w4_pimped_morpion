require 'bundler'
require 'pry'

class Board
attr_accessor :array

  def initialize
    @array = [".",".",".",".",".",".",".",".","."]
  end

  def display_board(array)
      puts "       1         2         3     "
      puts "  -------------------------------"
      puts "  |         |         |         |"
      puts "A |    #{array[0]}    |    #{array[1]}    |    #{array[2]}    |"
      puts "  |         |         |         |"
      puts "  -------------------------------"
      puts "  |         |         |         |"
      puts "B |    #{array[3]}    |    #{array[4]}    |    #{array[5]}    |"
      puts "  |         |         |         |"
      puts "  -------------------------------"
      puts "  |         |         |         |"
      puts "C |    #{array[6]}    |    #{array[7]}    |    #{array[8]}    |"
      puts "  |         |         |         |"
      puts "  -------------------------------"
  end

  def has_got_a_winner?(array)
    if
      ( array[0] == "X" && array[1] == "X" && array[2] == "X" ) || ( array[3] == "X" && array[4] == "X" && array[5] == "X" ) || ( array[6] == "X" && array[7] == "X" && array[8] == "X" ) || ( array[0] == "X" && array[3] == "X" && array[6] == "X" ) || ( array[1] == "X" && array[4] == "X" && array[7] == "X" ) || ( array[2] == "X" && array[5] == "X" && array[8] == "X" ) || ( array[0] == "X" && array[4] == "X" && array[8] == "X" ) || ( array[6] == "X" && array[4] == "X" && array[2] == "X" ) || ( array[0] == "O" && array[1] == "O" && array[2] == "O" ) || ( array[3] == "O" && array[4] == "O" && array[5] == "O" ) || ( array[6] == "O" && array[7] == "O" && array[8] == "O" ) || ( array[0] == "O" && array[3] == "O" && array[6] == "O" ) || ( array[1] == "O" && array[4] == "O" && array[7] == "O" ) || ( array[2] == "O" && array[5] == "O" && array[8] == "O" ) || ( array[0] == "O" && array[4] == "O" && array[8] == "O" ) || ( array[6] == "0" && array[4] == "O" && array[2] == "O" )
      true
    end
  end

  def is_full?(array)
    if !array.include?('.') 
       true 
    end
  end

end
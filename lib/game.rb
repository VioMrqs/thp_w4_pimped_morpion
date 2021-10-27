# require 'pry'
class Game
 attr_accessor :player1, :player2, :starting_player, :following_player

  def initialize(name1,name2)
    @player1 = Player.new(name1)
    @player2 = Player.new(name2)
    puts "Bienvenue à #{name1} et #{name2}!"
  end

  def defining_starting_player
    coin_toss = rand(1..2)
    if coin_toss == 1
      @starting_player = @player1
      @following_player = @player2
    else
      @starting_player = @player2
      @following_player = @player1
    end
  end

  def playing_choice(player)
    puts "#{player.name} choisis une case, A/B/C pour la ligne et 1/2/3 pour la colonne. Par exemple A1"
    choice = gets.chomp.upcase
    possible_moves = ["A1","A2","A3","B1","B2","B3","C1","C2","C3"]
    until (possible_moves).include?(choice) do
        puts "Cette coordonnées n'existe pas, ré-essaye !"
        choice = gets.chomp.upcase
    end
    return choice
  end
  
  def playing_move(playing_choice, array, player)
    possible_moves = ["A1","A2","A3","B1","B2","B3","C1","C2","C3"]
    possible_moves.each do |i|
      if i.include?(playing_choice) 
        if player == @starting_player.name
          array[possible_moves.index(i)] = "X"
        elsif player == @following_player.name
          array[possible_moves.index(i)] = "O"
        end
      end
    end
    return array 
  end

  def round_pt1(array)
    choice1 = playing_choice(@starting_player)
    playing_move(choice1, array, @starting_player.name)
  end

  def round_pt2(array)
    choice2 = playing_choice(@following_player)
    playing_move(choice2, array, @following_player.name)
  end
  
  def play_another_game?
    puts "Cette partie est finie. Voulez-vous jouer à nouveau (y/n)?"
    print ">"
    answer = gets.chomp
      until answer == "y" || answer == "n"
        puts "Veuillez taper 'y' ou 'n'."
        answer = gets.chomp
      end
    case
      when answer == "y"
        puts "Bien, c'est reparti!"
      when answer == "n"
        puts "D'accord ! Merci d'avoir joué."
        exit!
    end
  end

end   

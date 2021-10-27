require 'bundler'
Bundler.require

$:.unshift File.expand_path('lib', __dir__)
# List the files that we'll require.
require 'player'
require 'game'
require 'board'

# Initialize the game with 2 players.
puts "Bienvenue ! Ce jeu se joue à deux ; prenons vos noms.".colorize(:mode => :bold, :background => :black)
puts "Quel est ton blaze?".colorize(:mode => :bold)
print '>'
name1 = gets.chomp

puts 'Et toi, vaillant adversaire ?'.colorize(:mode => :bold)
print '>'
name2 = gets.chomp

# Initialiazing the game and the board
game_1 = Game.new(name1, name2)
board_1 = Board.new

# Saying who is the first to play.
game_1.defining_starting_player
puts "C'est l'heure du tirage au sort :".colorize(:mode => :bold, :background => :black)
puts " "
puts "le premier joueur sera #{game_1.starting_player.name}.".colorize(:background => :red)
puts "le second joueur sera #{game_1.following_player.name}.".colorize(:background => :blue)

game_counter = 0
starting_player_victories = 0
following_player_victories = 0

loop do
  puts " "
  puts "#{game_counter} parties ont été joués pour le moment."
  puts "#{game_1.starting_player.name} a gagné #{starting_player_victories} parties.".colorize(:background => :red)
  puts "#{game_1.following_player.name} a gagné #{following_player_victories} parties.".colorize(:background => :blue)

  # Showing board
  puts " "
  puts "Voici votre terrain de jeu !".colorize(:mode => :bold, :background => :black)
  board_1.display_board(board_1.array)

# Loop on victory conditions
  until board_1.has_got_a_winner?(board_1.array) || board_1.is_full?(board_1.array)

    game_1.round_pt1(board_1.array)
    board_1.display_board(board_1.array)

    if board_1.has_got_a_winner?(board_1.array)
      puts "Bravo #{game_1.starting_player.name}, tu as gagné !".colorize(:background => :red)
      starting_player_victories += 1
    elsif board_1.is_full?(board_1.array)
      puts 'Raté, on recommence ?'
    end

    break if board_1.has_got_a_winner?(board_1.array) || board_1.is_full?(board_1.array)

    game_1.round_pt2(board_1.array)
    board_1.display_board(board_1.array)

    if board_1.has_got_a_winner?(board_1.array)
      puts "Bravo #{game_1.following_player.name}, tu as gagné !".colorize(:background => :blue)
      following_player_victories += 1
    elsif board_1.is_full?(board_1.array)
      puts 'Raté, on recommence ?'
    end

  end

  game_1.play_another_game?
  game_counter += 1
  board_1 = Board.new
end

binding.pry

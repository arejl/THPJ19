require 'pry'
require_relative 'player'
require_relative 'board'
require_relative 'show'

class Game

  attr_accessor :players

  def initialize(players)
    @players=players
    @@board = Board.new
  end

  def is_still_ongoing?

    control = 0 #Cette variable calcule le nombre de cases vides.
    @@winner = nil #Cette variable va enregistrer le symbole du gagnant.

    @@board.grid.each do |boardcase|
      if boardcase.content == " "
        control += 1
      end
    end

    #Pour chaque diagonale/ligne/colonne, on regarde si 1. la case n'est pas vide et 2. si les 3 cases
    #ont le même contenu. Si c'est le cas, quelqu'un a gagné : c'est la personne dont le symbole est 
    #dans une des cases. On enregistre ce symbole dans @@winner.

    if @@board.line1[0] != " " && (@@board.line1.uniq.size <=1 || @@board.vertical1.uniq.size <=1 || @@board.diagonal1.uniq.size <=1)
      @@winner = @@board.line1[0]
      return false
    elsif @@board.line2[1] != " " && (@@board.line2.uniq.size <=1 || @@board.vertical2.uniq.size <=1 || @@board.diagonal2.uniq.size <=1)
      @@winner = @@board.line2[1]
      return false
    elsif @@board.line3[2] != " " && (@@board.line3.uniq.size <=1 || @@board.vertical3.uniq.size <=1)
      @@winner = @@board.line3[2]
      return false
    elsif control == 0 #Si aucune case n'est vide mais il n'y a pas de ligne complète, personne n'a gagné mais le jeu s'arrête.
      return false
    else
      return true
    end
  end

  def choice(player_name, player_symbol)

    valid_choices = Array.new
    selection = Array.new
    selection << player_symbol

    puts
    puts "Au tour de #{player_name} de jouer !"
    puts "#{player_name} joue avec les #{player_symbol}"
    puts
    sleep(1)
    puts "Voici la grille :"
    Show.new.show_board(@@board)
    sleep(1)
    
    loop do #On demande à l'utilisateur quelle case il veut remplir.
      puts "Où veux-tu jouer ?"
      @@board.grid.each_with_index do |element, index|
        if element.content == " " #On n'affiche pas les cases qui ont été remplies.
          puts "#{index} - #{element.placement}"
          valid_choices << index.to_s #Cet array enregistre les choix de case possibles.
        end
      end
      print ">"
      choice_placement = gets.chomp
      if valid_choices.include? choice_placement 
        selection << choice_placement #Si le choix de l'utilisateur fait partie des choix possibles, on garde son choix.
        break
      else
        puts "Choisis une valeur valide stp"
      end
    end
    @@board.fill(selection[0], selection[1]) #On remplit la case indiquée par l'utilisateur avec le symbole qui lui a été attribué (X ou O).
  end
    
  def game_end
    puts
    Show.new.show_board(@@board)
    puts
    if @@winner == nil #Dans le cas où la grille est remplie sans que personne ne gagne.
      puts "Personne n'a gagné :/"
    else
      puts "Les #{@@winner} ont gagné !" #Si quelqu'un a gagné, @@winner a enregistré son symbole.
      @players.each do |player|
        if player.symbol == @@winner #On trouve le nom du gagnant en le recherchant avec son symbole.
          puts "Bravo, #{player.name} ! <3"
        end
      end
    end
  end

end


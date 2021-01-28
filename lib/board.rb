require 'pry'
require_relative 'boardcase'

class Board
  attr_reader :grid, :line1, :line2, :line3, :vertical1, :vertical2, :vertical3, :diagonal1, :diagonal2
  def initialize

    #On crée des cases individuelles (Boardcase) en leur attribuant un emplacement.
    #On les stocke dans un array global, @grid, qui contient toute l'information (valeur de la case + emplacement),
    #et en même temps on met les valeurs de chaque case dans des arrays ligne/colonne/diagonale, qui 
    #vont servir à vérifier si quelqu'un a gagné dans la méthode is_still_ongoing? de la classe Game.

    @grid = Array.new
    @line1 = Array.new
    @line2 = Array.new
    @line3 = Array.new

    3.times do |i|
      new_case = Boardcase.new
      new_case.placement = "A#{i+1}"
      @line1 << new_case.content
      @grid << new_case
    end
    3.times do |i|
      new_case = Boardcase.new
      new_case.placement = "B#{i+1}"
      @line2 << new_case.content
      @grid << new_case
    end
    3.times do |i|
      new_case = Boardcase.new
      new_case.placement = "C#{i+1}"
      @line3 << new_case.content
      @grid << new_case
    end

    @vertical1 = [@line1[0], @line2[0], @line3[0]]
    @vertical2 = [@line1[1], @line2[1], @line3[1]]
    @vertical3 = [@line1[2], @line2[2], @line3[2]]
    @diagonal1 = [@line1[0], @line2[1], @line3[2]]
    @diagonal2 = [@line1[2], @line2[1], @line3[0]]
  end

  def refresh #On met à jour les lignes/colonnes en cas de changement dans l'array global @grid.
    @line1=[@grid[0].content, @grid[1].content, @grid[2].content]
    @line2=[@grid[3].content, @grid[4].content, @grid[5].content]
    @line3=[@grid[6].content, @grid[7].content, @grid[8].content]
    @vertical1 = [@line1[0], @line2[0], @line3[0]]
    @vertical2 = [@line1[1], @line2[1], @line3[1]]
    @vertical3 = [@line1[2], @line2[2], @line3[2]]
    @diagonal1 = [@line1[0], @line2[1], @line3[2]]
    @diagonal2 = [@line1[2], @line2[1], @line3[0]]
  end

  def fill(symbol, placement) #On va utiliser cette fonction pour remplir une case donnée avec un X ou un O.
    @grid[placement.to_i].content = symbol
    refresh #On fait une mise à jour pour vérifier par la suite si quelqu'un a gagné en changeant le contenu de la case.
  end

end
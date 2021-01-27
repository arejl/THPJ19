require 'pry'
require_relative 'board'

class Show

  attr_accessor :game_board

  def show_board(board) #On imprime la grille en récupérant les valeurs du board ligne par ligne.
    @game_board = board
    puts " "*4 + "1" + " "*4 + "2" + " "*4 + "3" + " "*4
    puts "-"*17
    print "A "
    (0..2).each do |i|
      print "| #{@game_board.line1[i]} |"
    end
    puts
    puts "-"*17
    print "B "
    (0..2).each do |i|
      print "| #{@game_board.line2[i]} |"
    end
    puts
    puts "-"*17
    print "C "
    (0..2).each do |i|
      print "| #{@game_board.line3[i]} |"
    end
    puts
    puts "-"*17
  end

end
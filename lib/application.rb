require 'pry'
require 'lolize/auto'
require_relative 'game'
require_relative 'player'

class Application

  def initialize
    @@encore_result = 1 #Cette variable sert à proposer de nouvelles parties tant que le joueur l'accepte.
    #Par défaut, elle vaut 1, pour lancer la première partie.

    @@players = Array.new

    puts "Bonjour et bienvenue dans ce fantastique jeu de MORPION"
    puts "Comment t'appelles-tu ?"
    print ">"
    name1 = gets.chomp
    player1 = Player.new(name1)
    player1.symbol = "X" #On attribue les symboles X et O aux joueurs.
    @@players << player1

    puts "Comment s'appelle le joueur n°2 ?"
    print ">"
    name2 = gets.chomp
    player2 = Player.new(name2)
    player2.symbol = "O"
    @@players << player2

    @@players.each {|player| puts "#{player.name} joue avec les #{player.symbol}."}
    puts "C'est parti !"

    sleep(1)

    @@game = Game.new(@@players)
  end

  def app_round
    while @@game.is_still_ongoing? == true
      (0..1).each do |n| #On alterne joueur 0 et joueur 1.
        if @@game.is_still_ongoing? == true #Si le joueur 0 vient de gagner, le joueur 1 ne joue pas, on arrête le each.
          @@game.choice(@@game.players[n].name, @@game.players[n].symbol)
        else
          break
        end
      end
    end
  end

  def encore
    loop do
      puts "Voulez-vous rejouer ?"
      print "(Y/N) >"
      choice = gets.chomp

      if choice.upcase == "Y"
        @@game = Game.new(@@players) #On remplace le jeu terminé par un nouveau.
        break
      elsif choice.upcase == "N"
        puts "OK, à la prochaine !"
        @@encore_result = 0 #La boucle while de app.rb s'arrête et on sort du programme.
        break
      else
        puts "Entre un choix valide stp (Y/N)"
      end
    end
  end

  def perform
    while @@encore_result == 1
      app_round
      @@game.game_end
      encore
    end
  end
end

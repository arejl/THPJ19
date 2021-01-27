require 'pry'

class Player
  
  attr_reader :name
  attr_accessor :symbol

  def initialize(given_name)
    @name = given_name
    @symbol = nil #Le joueur n'a pas encore de symbole attribué, cela dépendra de s'il est joueur 1 ou 2.
    puts "Bienvenue, #{@name}"
  end
end
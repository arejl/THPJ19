require 'pry'

class Boardcase
  attr_accessor :content, :placement
  def initialize #On initialise des cases vides, qui ne sont pas encore placées dans le board.
    @content = " "
    @placement = nil
  end
end
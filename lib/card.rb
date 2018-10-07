require 'pry'

class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def sorting_value
    janet = {
      "2" => 5,
      "3" => 10,
      "4" => 15,
      "5" => 20,
      "6" => 25,
      "7" => 30,
      "8" => 35,
      "9" => 40,
      "10" => 45,
      "Jack" => 50,
      "Queen" => 55,
      "King" => 60,
      "Ace" => 65
    }

    abernathy = {
      "Clubs" => 1,
      "Diamonds" => 2,
      "Hearts" => 3,
      "Spades" => 4
    }

    janet[@value] + abernathy[@suit]
    
  end

end

require 'pry'

class Card
  attr_reader :value, :suit, :ranked_value

  def initialize(value, suit)
    @value = value
    @suit = suit
    numbers = {
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

     names = {
      "Clubs" => 1,
      "Diamonds" => 2,
      "Hearts" => 3,
      "Spades" => 4
    }
    @ranked_value = numbers[@value] + names[@suit]
  end

end

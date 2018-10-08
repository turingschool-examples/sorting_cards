class Card
  attr_accessor :value, :suit, :rank

  def initialize(value, suit)
    @value = value
    @suit = suit
    value_ranks = { "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7,
      "8" => 8, "9" => 9, "10" => 10, "Jack" => 11, "Queen" => 12, "King" => 13, "Ace" => 14 }
    suit_ranks = {"Clubs" => 1, "Diamonds" => 2, "Hearts" => 3, "Spades" => 4}
    @rank = (value_ranks[@value] * 4) + suit_ranks[@suit]
  end
#keys reference values
#hash = {key => value}



end

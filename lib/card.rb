class Card
  attr_reader :value,
              :suit,
              :order_id

 def initialize(value, suit)
  @value = value
  @suit = suit
  values = {
    "2" => 2,
    "3" => 6,
    "4" => 10,
    "5" => 14,
    "6" => 18,
    "7" => 22,
    "8" => 26,
    "9" => 30,
    "10" => 34,
    "Jack" => 38,
    "Queen" => 42,
    "King" => 46,
    "Ace" => 50,
    "Clubs" => 0,
    "Diamonds" => 1,
    "Hearts" => 2,
    "Spades" => 3
                }

    @order_id = values[value] + values[suit]

 end


end

class Card
  attr_reader :value,
              :suit,
              :card_total

  def initialize(value, suit)
    @value = value
    @suit = suit
    value_assignment = {
      "2" => 20,
      "3" => 30,
      "4" => 40,
      "5" => 50,
      "6" => 60,
      "7" => 70,
      "8" => 80,
      "9" => 90,
      "10" => 100,
      "Jack" => 110,
      "Queen" => 120,
      "King" => 130,
      "Ace" => 140
    }
    suit_assignment =
       {
         "Clubs" => 1,
         "Diamonds" => 2,
         "Hearts" => 3,
         "Spades" => 4
       }

    @card_total = value_assignment[@value] + suit_assignment[@suit]
  end

end

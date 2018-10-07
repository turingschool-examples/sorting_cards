class Card
  attr_reader :value, :suit, :card_sum

  def initialize(value, suit)
    @value = value
    @suit = suit
    card_reference = {
                      "Clubs" => 1,
                      "Diamonds" => 2,
                      "Hearts" => 3,
                      "Spades" => 4,
                      "2" => 100,
                      "3" => 200,
                      "4" => 300,
                      "5" => 400,
                      "6" => 500,
                      "7" => 600,
                      "8" => 700,
                      "9" => 800,
                      "10" => 900,
                      "Jack" => 1000,
                      "Queen" => 1100,
                      "King" => 1200,
                      "Ace" => 1300
                      }
    @card_sum = card_reference[@value] + card_reference[@suit]
  end

end

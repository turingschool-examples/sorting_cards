
class Card
  attr_reader :value, :suit
  def initialize(value, suit)

    @value = value
    @suit = suit
  end

  def value
    @value
  end

  def suit
    @suit
  end

  def number_card_value
    new_card_value = {
      "2" => 10,
      "3" => 20,
      "4" => 30,
      "5" => 40,
      "6" => 50,
      "7" => 60,
      "8" => 70,
      "9" => 80,
      "10" => 90,
      "Jack" => 100,
      "Queen" => 110,
      "King" => 120,
      "Ace" => 130
    }
    new_card_value[value]
  end

  def number_card_suit
    new_card_suit = {
      "Clubs" => 1,
      "Diamonds" => 2,
      "Hearts" => 3,
      "Spades" => 4
    }
    new_card_suit[suit]
  end
  def total_value
    number_card_value + number_card_suit
  end

end

class Card

  attr_reader :suit,
              :value
  def initialize(value, suit)
    @suit = suit
    @value = value
  end

  def has_a_value
    @value = "Ace"
  end
  
  def has_a_suit
    @suit = "Spades"
  end
end

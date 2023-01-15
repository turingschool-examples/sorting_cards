class Card

  attr_reader :suit,
              :value
  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def value
    @value = "Ace"
  end
  
  def suit
    @suit = "Spades"
  end
end

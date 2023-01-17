class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
    @suit = suit
    @value = value
    @count = 3
  end

  def cards 
    @cards   
  end

  def count
    @count = 3
  end
end
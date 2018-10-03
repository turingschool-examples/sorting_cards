#Create a Deck class with an accompanying test file.
# A Deck is initialized with an array of Card objects.

class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.size
  end
end

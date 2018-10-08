class Deck
  attr_reader :cards
def initialize(cards)
  @cards = cards
end

def count
  @cards.length
end

def new_card
  cards.shift 
end
end

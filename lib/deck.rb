class Deck
  attr_reader :cards,
              :sort

  def initialize(cards)
    @cards = cards
    @sort = sort
  end

  def count
    cards.length
  end
end

# compare a pair of adjacent values
# if
# lowest to highest is 2 through 10, Jack, Queen, King, Ace.

#repeat

#compare adjacent suits
#lowest to highest is Clubs, Diamonds, Hearts, Spades.

#repeat

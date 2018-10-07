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

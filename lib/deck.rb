class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
    #test this
  end

  def count
    @cards.count
  end

end

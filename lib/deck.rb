class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    if cards.kind_of?(Array)
      @cards.count
    else
      "Error: deck.cards is not an Array"
    end
  end
end
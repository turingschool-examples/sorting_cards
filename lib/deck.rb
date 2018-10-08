
class Deck
  attr_reader :cards, :sort

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end
end

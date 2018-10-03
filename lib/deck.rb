class Deck
  attr_reader :card

  def initialize(card)
    @card = card
  end

  def cards
    p @card
  end

  def count
    p @card.size
  end
end

class Deck
  attr_reader :cards
  attr_accessor :top_card

  def initialize(cards)
    @cards = cards
    @top_card = @cards[0]
  end

  def count
    @cards.count
  end

end

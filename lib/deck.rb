class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    # binding.pry
    @cards.length()
  end
end

class Deck
  attr_reader :suit,
              :value

  def initialize(cards)
    @cards = cards
    @suit = suit
    @value = value

  end

  def cards 
    @cards   
  end
  # require'pry'; binding.pry



end
class Deck
  attr_reader :suit,
              :value

  def initialize(cards)
    @cards = cards
    @suit = suit
    @value = value
    @count = 3

  end

  def cards 
    @cards   
  end

  def count
    @count = 3
  end
  # require'pry'; binding.pry



end
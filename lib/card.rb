class Card
  attr_reader :value, :suit, :to_f
  def initialize(value, suit)
    @value = value
    @suit = suit
    @to_f = to_float
  end

  private

  def to_float
    suitdec = %w(Clubs Diamonds Hearts Spades).zip([0.1,0.2,0.3,0.4]).to_h
    val_f = value.to_f
    suit_f = suitdec[suit]
    return val_f + suit_f unless val_f == 0.0
    facecards = %w(Jack Queen King Ace).zip(11..14).to_h
    return facecards[value] + suit_f
  end
end

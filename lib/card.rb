class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @suit = suit
    @value = value
  end

  def value
    @value
  end

  def suit
    @suit
  end

end


class Card
  attr_reader :value, :suit
  def initialize(value, suit)

    @value = value
    @suit = suit
  end

  def value
    @value
  end
  def suit
    @suit
  end
end

card = Card.new("Jack", "Diamond")

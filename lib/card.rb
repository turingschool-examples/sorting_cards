require "pry"
class Card
  attr_reader :value, :suit
  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def to_i
    i = self.value.to_i
    return i unless i == 0
    facecards = %w(Jack Queen King Ace).zip(11..14).to_h
    return facecards[self.value]
  end
end

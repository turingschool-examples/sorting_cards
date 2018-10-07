class Card
  attr_accessor :value, :suit, :hash, :hashSuit, :rank
  def initialize(value, suit)
    @value = value
    @suit = suit
    @rank = Card.hash[@value] + (Card.hashSuit[@suit] * 13)
  end

  def to_s
    "#{@value} of #{@suit}"
  end

  def greater(card1, card2)
    card1.rank > card2.rank
  end
  class << self
    def hash
      { '2' => 1, '3' => 2, '4' => 3, '5' => 4, '6' => 5, '7' => 6, '8' => 7, '9' => 8, '10' => 9, 'Jack' => 10, 'Queen' => 11, 'King' => 12, 'Ace' => 13 }
    end

    def hashSuit
      { 'Clubs' => 1, 'Diamonds' => 2, 'Hearts' => 3, 'Spades' => 4 }
    end

    def parse(string)
      arr = string.split('of').map(&:strip)
      Card.new(arr[0], arr[1])
    end
  end
end

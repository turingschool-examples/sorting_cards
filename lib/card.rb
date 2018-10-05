class Card
  attr_accessor :value, :suit, :hash, :hashSuit, :rank

  def initialize(value, suit)
    @value = value
    @suit = suit
    @hash = { '2' => 1, '3' => 2, '4' => 3, '5' => 4, '6' => 5, '7' => 6, '8' => 7, '9' => 8, '10' => 9, 'Jack' => 10, 'Queen' => 11, 'King' => 12, 'Ace' => 13 }
    @hashSuit = { 'Clubs' => 1, 'Diamonds' => 2, 'Hearts' => 3, 'Spades' => 4 }
    @rank = @hash[@value] + (@hashSuit[@suit] * 13)
  end

  def to_s
    "#{@value} of #{@suit}"
  end

  def self.parse(string)
    arr = string.split('of').map(&:strip)
    Card.new(arr[0], arr[1])
  end

  def greater(card1, card2)
    if @hash[card1.value].to_i == @hash[card2.value].to_i
      @hashSuit[card1.suit].to_i > @hashSuit[card2.suit].to_i
    else
      @hash[card1.value].to_i > @hash[card2.value].to_i
    end
  end
end

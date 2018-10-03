class Card
  attr_accessor :value, :suit
  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def to_s
    "#{@value} of #{@suit}"
  end

  def self.parse(string)
    arr = string.split('of').map(&:strip)
    Card.new(arr[0], arr[1])
  end
end

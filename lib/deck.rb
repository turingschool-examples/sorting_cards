require 'pry'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def sort
    (@cards.length - 1).times do |i|
      swap(i)
    end
    @cards
  end

  def swap(i)
    if @cards[i].rank > @cards[i + 1].rank
      @cards[i], @cards[i + 1] = @cards[i + 1], @cards[i]
    end
  end
end

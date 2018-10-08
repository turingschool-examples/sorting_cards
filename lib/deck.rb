require 'pry'
class Deck
attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end
binding.pry
  def sort
    until sorted? do
      runs_though = @cards.length - 1
      runs_though.times do |i|
        if @cards[i].actual_value > @cards[i + 1].actual_value
          swaps(@cards, i, i + 1)
        end
      end
    end
    return @cards
  end

  def sorted?
    @cards.each_index do |card|
      if @cards[card].actual_value < @cards[card + 1].actual_value
        return true
      else
        return false
      end
  end
  end

  def swaps(array, x, y)
    a = @cards[x]
    b = @cards[y]
    @cards[x] = b
    @cards[y] = a
  end
end

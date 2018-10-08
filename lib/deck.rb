require './lib/card'

class Deck
attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

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
    @cards.each_index do |c|
      if @cards[c].actual_value < @cards[c + 1].actual_value
        return true
      else
        return false
      end
  end
  end

  def swaps(array, x, y)
    a = array[x]
    b = array[y]
    array[x] = b
    array[y] = a
  end
end

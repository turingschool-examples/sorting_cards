require './lib/card'
require 'pry'


class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def greater_than(i)
    values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
    @cards[i].value == @cards[i+1].value && @cards[i].suit > @cards[i+1].suit || values.find_index(@cards[i].value) > values.find_index(@cards[i+1].value)
  end

  def sort
    return @cards if @cards.length <= 1
    swapped = true
    while swapped
      swapped = false
      i = 0
      while i < @cards.length - 1
        if greater_than(i)
          @cards[i], @cards[i+1] = @cards[i+1], @cards[i]
          swapped = true
        end
        i += 1
      end
    end
    return @cards
  end

  def merge_sort(cards = @cards)
    return cards if cards.length <= 1
    half = cards.length / 2
    binding.pry
    left_array = merge_sort(cards.take(half))
    right_array = merge_sort(cards.drop(half))
    merge(left_array,right_array)
  end

  def merge

  end

end

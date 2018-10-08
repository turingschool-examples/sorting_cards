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

  def greater_than(card_1, card_2)
    values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
    card_1.value == card_2.value && card_1.suit > card_2.suit || values.find_index(card_1.value) > values.find_index(card_2.value)
  end

  def sort(cards = @cards)
    return cards if cards.length <= 1
    swapped = true
    while swapped
      swapped = false
      i = 0
      while i < cards.length - 1
        if greater_than(cards[i], cards[i+1])
          cards[i], cards[i+1] = cards[i+1], cards[i]
          swapped = true
        end
        i += 1
      end
    end
    return cards
  end

  def merge_sort(cards = @cards)
    return cards if cards.length <= 1
    half = cards.length / 2
    left_array = merge_sort(cards.take(half))
    right_array = merge_sort(cards.drop(half))
    merge(left_array, right_array)
  end

  def merge(left_array, right_array)
    sorted_array = []
    until left_array.empty? || right_array.empty?
      if greater_than(left_array.first, right_array.first)
        sorted_array << right_array.shift
      else
        sorted_array << left_array.shift
      end
    end
    sorted_array + left_array + right_array
  end

end

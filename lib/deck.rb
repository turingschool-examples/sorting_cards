require './lib/card'
require 'pry'


class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def sort
    values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
    return @cards if @cards.length <= 1
    swapped = true
    while swapped
      swapped = false
      i = 0
      while i < @cards.length - 1
        if (@cards[i].value == @cards[i+1].value && @cards[i].suit > @cards[i+1].suit) || values.find_index(@cards[i].value) > values.find_index(@cards[i+1].value)
          @cards[i], @cards[i+1] = @cards[i+1], @cards[i]
          swapped = true
        end
        i += 1
      end
    end
    return @cards
  end
  
end

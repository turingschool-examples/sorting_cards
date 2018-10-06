require './lib/card.rb'

class Deck
  attr_reader :cards,
              :card_order

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def next_card
    cards.shift
  end

  def sorted?(array)
    (array.length - 1).times do |i|
      if array[i] > array[i + 1]
        return false
      end
    end
    true
  end

  def sort
    index = @cards.length - 2
    until sorted?(@cards)
      (@cards.length - 1).times do |i|
        if @cards[i] > @cards[i+1]
          @cards[i], @cards[i+1] = @cards[i+1], @cards[i]
        end
      end
    end
    return @cards
  end


end

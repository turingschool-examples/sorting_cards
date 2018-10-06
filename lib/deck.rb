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
    (array.length - 1).times do |card|
      if array[card].valuation > array[card + 1].valuation
        return false
      end
    end
    true
  end

  def sort
    until sorted?(@cards)
      (@cards.length - 1).times do |card|
        if @cards[card].valuation > @cards[card+1].valuation
          @cards[card], @cards[card+1] = @cards[card+1], @cards[card]
        end
      end
    end
    return @cards
  end


end

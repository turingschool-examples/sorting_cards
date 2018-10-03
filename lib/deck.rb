require 'pry'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
    # binding.pry
  end

  def count
    @cards.length
  end

  def sort
    n = @cards.length
    loop do
      swapped = false
      (n-1).times do |index|
        if @cards[index] > @cards[index + 1]
          @cards[index],@cards[index + 1] = @cards[index + 1],@cards[index]
          swapped = true
        end
      end
      break if not swapped
    end
    cards
  end

end

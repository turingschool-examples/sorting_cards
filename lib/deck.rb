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
      loop do
        swap = false
        (@cards.length - 1).times do |i|
          if @cards[i].rank > @cards[i + 1].rank
            @cards[i], @cards[i + 1] = @cards[i + 1], @cards[i]
            swap = true
          end
        end
        @cards if !swap
      end
  end
end

require './lib/deck'
require './lib/card'

class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end


    def sort
        done = false
        while done == false do
          (count - 1).times do |i|
            if @cards[i].order_id > @cards[i + 1 ].order_id
              @cards[i], @cards[i + 1] = @cards[i + 1],@cards[i]
              done = false
            else done = true
            end
          end
        end
      @cards
    end
  end

require 'pry'

class Deck
  attr_reader :cards
  attr_accessor :top_card

  def initialize(cards)
    @cards = cards
    @top_card = @cards[0]
  end

  def count
    @cards.count
  end

  def sort
    switch = true
        while switch do
          switch = false
          (count - 1).times do |index|
            # binding.pry
            if @cards[index].ranked_value > @cards[index + 1].ranked_value
              @cards[index], @cards[index +1] = @cards[index + 1], @cards[index]
              switch = true
            end
          end
        end
      @cards
      binding.pry
  end

end

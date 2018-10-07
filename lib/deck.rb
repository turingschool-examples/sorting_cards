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
    sorted_cards = []
    loop do
      binding.pry
      if @cards[0].sorting_value > @cards[2].sorting_value
        @cards[0] = @cards[1]
      elsif
        @cards[1].sorting_value > @cards[2].sorting_value
        @cards[1] = @cards[2]
        #this is not the way to switch them!!!
      elsif
        @cards[2].sorting_value > @cards[3].sorting_value
        @cards[2] = @cards[3]
      elsif
        @cards[3].sorting_value > @cards[4].sorting_value
        @cards[3] = @cards[4]
      end
      break
      sorted_cards
    end
  end
end

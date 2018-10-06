require 'pry'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
   @cards.size
  end

#utilize a bubble sort for iteration 3 just because it's easiest apparently
  def sort
end

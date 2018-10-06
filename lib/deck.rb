require 'pry'

class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.size
  end

  def sort
    sorter = Sorter.new(@cards)
    sorter.value_deck
    sorter.sort
  end



end

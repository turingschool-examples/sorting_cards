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
    Sorter.new(@cards).sort
  end

  def merge_sort
    MergeSorter.new(@cards).merge_sort_and_resolve
  end

end

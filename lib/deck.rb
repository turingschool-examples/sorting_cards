
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def sort
    sorter = Sorter.new(self)
    sorter.sort
  end

  def merge_sort
    sorter = Sorter.new(self)
    sorter.mergesort
  end
end

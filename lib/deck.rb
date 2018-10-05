class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    cards.length
  end

  def sort
    sortBubbleRank(@cards)
  end

  def sortBubbleRank(array)
    0.upto(array.size - 2) do |i|
      bool = swap(array, i, i + 1) if array[i].rank > array[i + 1].rank
    end
  end

  def swap(array, index1, index2)
    one = array[index1]
    two = array[index2]
    array[index1] = two
    array[index2] = one
    array
  end
end

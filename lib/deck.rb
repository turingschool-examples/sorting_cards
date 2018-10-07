class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    cards.length
  end

  def sort
    Deck.sortBubbleRank(@cards)
  end

  def shuffle!
    @cards.shuffle!
  end

  def shuffle
    @cards.shuffle
  end

  class << self
    def sortBubbleRank(array)
      loop do
        bool = false
        0.upto(array.size - 2) do |i|
          if array[i].rank > array[i + 1].rank
            swap(array, i, i + 1)
            bool = true
          end
        end
        break unless bool
      end
      array
    end

    def swap(array, index1, index2)
      one = array[index1]
      two = array[index2]
      array[index1] = two
      array[index2] = one
    end
  end
end

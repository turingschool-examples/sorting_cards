class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    cards.length
  end

  def sort
    sortBubble(@cards)
  end

  def sortBubble(array)
    0.upto(array.size - 2) do |i|
      bool = swap(array, i, i + 1) if bool = greater(array[i], array[i + 1])
      p bool
    end
  end

  def swap(array, index1, index2)
    one = array[index1]
    two = array[index2]
    array[index1] = two
    array[index2] = one
    array
  end

  def greater(card1, card2)
    if @hash[card1.value].to_i == @hash[card2.value].to_i
      @hashSuit[card1.suit].to_i > @hashSuit[card2.suit].to_i
    else
      @hash[card1.value].to_i > @hash[card2.value].to_i
    end
  end
end

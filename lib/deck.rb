class Deck
  attr_accessor :cards
  def initialize(*cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def sort
    sorted = false
    until sorted
      cards_duplicate = cards.dup
      n = cards.length
      (n-1).times do |i|
        if cards[i+1] < cards[i]
          cards[]
      end
    end
  end

  def reverse_sort

  end
end

class Deck
  attr_accessor :cards
  def initialize(*cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def sort(sort_direction = {reverse: false})
    sorted = false
    until sorted
      cards_duplicate = cards.dup
      n = cards.length
      (n-1).times do |i|
        if sort_direction[:reverse]
          check_for_swap(i, true)
        else
          check_for_swap(i)
        end
      end
      sorted = true if cards_duplicate == cards
    end
  end

  def check_for_swap(i, reverse = false)
    if reverse
      if cards[i] < cards[i+1]
        cards[i], cards[i+1] = cards[i+1], cards[i]
      end
    else
      if cards[i+1] < cards[i]
        cards[i], cards[i+1] = cards[i+1], cards[i]
      end
    end
  end

end

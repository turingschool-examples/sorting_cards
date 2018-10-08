class Deck
  attr_reader     :cards

  def initialize(cards)
    @cards      = cards
  end

  def count
    @cards.count
  end

  def sort
    loop do
      sorted = false
      (@cards.length-1).times do |val|
        if @cards[val].card_sum > @cards[val + 1].card_sum
          first  = @cards[val]
          second = @cards[val + 1]
          @cards[val + 1] = first
          @cards[val]     = second
          sorted = true
        end
      end
      return @cards if not sorted
    end
  end

  def random_card
    random = @cards.shuffle.last
    random
  end
end

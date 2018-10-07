class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def sort
    loop do
      shuffled = false
      (count - 1).times do |i|
        if @cards[i].card_sum > @cards[i + 1].card_sum
          @cards[i], @cards[i + 1] = @cards[i + 1], @cards[i]
          shuffled = true
        end
      end
      break if not shuffled
    end
    @cards
  end

end

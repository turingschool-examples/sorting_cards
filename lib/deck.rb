class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    if cards.kind_of?(Array)
      @cards.count
    else
      "Error: deck.cards is not an Array"
    end
  end

  def sort
    (@cards.count - 1).times do |x|
      (@cards.count - 1 - x).times do |i|
        if @cards[i].card_weight > @cards[i+1].card_weight
          @cards[i], @cards[i+1] = @cards[i+1], @cards[i]
        end
      end
    end
    @cards
  end
end
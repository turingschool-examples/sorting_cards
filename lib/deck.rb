class Deck
  attr_reader :cards,
              :sort

  def initialize(cards)
    @cards = cards
    @sort = sort
  end

  def count
    cards.length
  end

  def sort
    done = false
    until done == true do
      (count-1).times do |index|
        if @cards[index].card_total > @cards[index+1].card_total
          @cards[index], @cards[index + 1] = @cards[index + 1], @cards[index]
          done = false
        else done = true
        end
      end
   end
   @cards
end
end

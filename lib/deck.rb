require 'pry'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
   @cards.size
  end


# utilize a bubble sort for iteration 3 because the internet says it's easiest for noobs
# we need the sort method to sort the cards based on their value from lowest to highest
# values -> lowest to highest: 2->10, Jack, Queen, King, Ace
# suits -> lowest to highest: Clubs, Diamonds, Hearts, Spades

# deck = Deck.new([@cards])

  def sort
    #if left card rank > right card rank, swap their position
    loop do
      deck_length = @cards.length
      switcheroo = false
      (deck_length-1).times do |i|
        if @cards[i].rank > @cards[i+1].rank
          switcheroo = true
          a = @cards[i]
          b = @cards[i+1]
          @cards[i+1] = a
          @cards[i] = b
        end
      end
        #stop iterating when no swaps occur during a full iteration of the loop
      if switcheroo == false
        break
      end
    end
    @cards
  end




#end the Deck class
end

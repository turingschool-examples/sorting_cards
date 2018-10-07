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

deck = Deck.new([@cards])

  def sort
    #if left card rank > right card rank, swap their position
    loop do
      pickles = deck.length
      (pickles-1).times do |i|
        switcheroo = false
        if deck[i].rank > deck[i+1].rank
          a = deck[i]
          b = deck[i+1]
          deck[i+1] = a
          deck[i] = b
          switcheroo = true
        end
        #stop iterating when no swaps occur during a full iteration of the loop
      break if switcheroo == false
      end
    end
  end




#end the Deck class
end

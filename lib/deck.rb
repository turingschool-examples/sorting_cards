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
# def sort(deck)
#   deck.each do |x|
#

# deck = ["4 of Hearts", "Ace of Spades", "5 of Diamonds", "Jack of Clubs", "Ace of Diamonds"]
# needs to be sorted into
# deck = ["4 of Hearts", "5 of Diamonds", "Jack of Clubs", "Ace of Diamonds", "Ace of Spades"]
# convert jack to 11, queen to 12, king to 13, ace to 14
# sort the values 2 to 14
# change 11 back to jack, 12 to queen, 13 to king, 14 to ace
#



#end the Deck class
end

require 'pry'


class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
   @cards.size
  end

#utilize a bubble sort for iteration 3 because it's easiest
  def sort(array)
        @cards.value do |v|
          if v == "Jack"
           v = "11"
          elsif v == "Queen"
           v = "12"
          elsif v == "King"
           v = "13"
          elsif v == "Ace"
           v = "14"
          end
        end

         @cards.suit do |s|
           if s == "Clubs"
             s = "1"
           elsif s == "Diamonds"
             s = "2"
           elsif s == "Hearts"
             s = "3"
           elsif s == "Spades"
             s = "4"
           end
         end
    n = array.length
      loop do
        swapped = false
        (n-1).times do |i|
          if array[i] > array[i+1]
            array[i], array[i+1] = array[i+1], array[i]
            swapped = true
          end
           break if swapped == false
        end
      end
    end
    # this method needs to do a few things:
    # it needs to sort the deck
    # however the built-in .sort method only does alphabetical or numerical order
    # so since we have strings (Queen, Ace, etc) AND integers (2..10),
    # we need to convert the card.value strings to integers by assigning them a positional number, and
    # that will sort them correctly according to the spec, which is:
    # 1) "The order of values from lowest to highest is: 2 through 10, Jack, Queen, King, Ace."
    # and 2) "if two cards have the same value, the suit should be used to determine the order they are sorted.
    #The order of suit from lowest to highest is Clubs, Diamonds, Hearts, Spades."

    #so we have two rules. tl;dr
    # values = [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]
    # suits = ["Clubs", "Diamonds", "Hearts", "Spades"]

    #I want to make [Jack=11, Queen=12, King=13, Ace=14]
    #I want to make [Clubs = 1, Diamonds = 2, Hearts = 3, Spades = 4]
end

require './lib/card'
require 'pry'

class Deck
attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def sorted?(cards)
    cards.each do |c|
      if cards[c].assign_value < cards[c + 1].assign_value
        return true
      else
        return false
      end
    end
  end

  def swap(array, i, j)
    x = array[i]
    y = array[j]
    array[i] = y
    array[j] = x
  end

  def sort
  total_it = (@cards.length - 1)
  until sorted?(@cards)
    total_it.times do |n|
      if @cards[n].assign_value > @cards[n + 1].assign_value
        swap(@cards, n, (n + 1))
      end
    end
  end
  return @cards
  end

end


#define method that determines if the deck is sorted by passing in cards sorted?(cards),
#using an each iterator, go through cards and check if the parameters have been met
#parameters are that card.value index on left is less than card.value index on right
#if true, return false
#if false, return false

#def method that swaps cards if value on left is > value on right
#set card array elements to variables
#x = card[i]
#y = card[i + 1]
#cards swap by the setting card [i] to y and thus switching locations
#card[i] = y
#card[i + 1] = x


#define method sort that will sort card array based on new assigned values
#tell ruby how many times to run through array
#total number of iterations that will take place is = length of cards array - 1
   #because if there are 4 elements, will take 3 iterations to pair cards together
   # total_it = (cards.length - 1)
#using an until loop until it meets the parameters of sorted? method, keep running block
#will do it the number of times in total_it and will keep running until sorted? is true
#total_it.times do |i|
  #if the instance variable of cards(with its new integer value, defined by new_value) is
  #greater than the instance variable of cards next to it, then it should swap places with it
  #if @cards[i].new_value > @cards[i+1].new_value
  #swap cards using swap method illustrated above
  #cards.swap
#keep running until sorted!

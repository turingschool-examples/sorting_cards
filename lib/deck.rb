require './lib/round'
require './lib/guess'
require './lib/card'
require './lib/deck'




class Deck
attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end
  #
  # def sort
  #
  #
  # end





end




#attr_reader :deck
  #def initialize(deck) #deck will be an array in runner file
  #  @deck = deck
  #end

#  def cards
#    deck
#  end

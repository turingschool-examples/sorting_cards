
class Deck
  attr_reader :cards, :sort

  def initialize(cards)
    @cards = cards
    # @sort = sort
  end

  def count
    cards.count
  end
end

#The cards need to be made
#then placed into an array outside of the clss
#The deck need to be able to interact with the cards array
#

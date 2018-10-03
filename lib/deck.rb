

class Deck
  attr_accessor :deck

  def initialize(deck)
  end

  # def cards
  #   # return deck (in an array)
  #   @deck
  # end
end

=begin

require './lib/card'
require './lib/deck'
card_1 = Card.new("3","Hearts")
card_2 = Card.new("4", "Clubs")
card_3 = Card.new("5", "Diamonds")
cards = [card_1, card_2, card_3]
deck = Deck.new(cards)

=end

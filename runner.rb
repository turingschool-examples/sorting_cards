require_relative 'lib/deck'
require_relative 'lib/guess'
require_relative 'lib/card'
require_relative 'lib/round'

#
#
card_1 = Card.new("4","Hearts")
card_2 = Card.new("4", "Spades")
card_3 = Card.new("4", "Diamonds")
card_4 = Card.new("4", "Clubs")
card_5 = Card.new("Ace", "Diamonds")
deck = Deck.new([card_4, card_3, card_1, card_2, card_5])


deck.merge_sort
require 'pry'; binding.pry

require './lib/deck'
require './lib/card'
require './lib/guess'
require './lib/round'
require 'pry'
card = Card.new("10", "Hearts")
guess = Guess.new("10 of Hearts", card)
# card_1 = Card.new("10","Hearts")
card_2 = Card.new("4", "Clubs")
card_3 = Card.new("5", "Diamonds")

cards = [card_2, card_3]#, card_3]

deck = Deck.new(cards)
round = Round.new(deck)


binding.pry

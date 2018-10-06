require './lib/card'
require './lib/guess'
require './lib/deck'


card_1 = Card.new("4","Hearts")
card_2 = Card.new("Ace", "Spades")
card_3 = Card.new("5", "Diamonds")
card_4 = Card.new("Jack", "Clubs")
card_5 = Card.new("Ace", "Diamonds")
deck = Deck.new([card_1, card_2, card_3, card_4, card_5])

#
# deck_unsorted = deck.cards.first
#
# p deck_unsorted

# p "card_1 = #{deck.cards[0].value} of #{deck.cards[0].suit}"
# p "card_2 = #{deck.cards[1].value} of #{deck.cards[1].suit}"
# p "card_3 = #{deck.cards[2].value} of #{deck.cards[2].suit}"
# p "card_4 = #{deck.cards[3].value} of #{deck.cards[3].suit}"
# p "card_5 = #{deck.cards[4].value} of #{deck.cards[4].suit}"

unsorted_deck = [deck]

p unsorted_deck

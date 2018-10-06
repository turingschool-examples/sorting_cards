require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require './lib/deck'

#
# pry(main)> card_1 = Card.new("3","Hearts")
# #=> #<Card:0x00007fa16104e160 @suit="Hearts", @value="3">
#
# pry(main)> card_2 = Card.new("4", "Clubs")
# #=> #<Card:0x00007fa160a62e90 @suit="Clubs", @value="4">
#
# pry(main)> card_3 = Card.new("5", "Diamonds")
# #=> #<Card:0x00007fa161a136f0 @suit="Diamonds", @value="5">
#
# pry(main)> cards = [card_1, card_2, card_3]
# pry(main)> deck = Deck.new(cards)
# #=> #<Deck:0x00007fa160a38ed8...>

class DeckTest < Minitest::Test

def test_deck_exists
  card_1 = Card.new("3","Hearts")
  card_2 = Card.new("4", "Clubs")
  card_3 = Card.new("5", "Diamonds")
  cards = [card_1, card_2, card_3]
  deck = Deck.new(cards)
  assert_instance_of Deck, deck
end

#
# pry(main)> deck.cards
# #=> [#<Card:0x00007fa16104e160...>, #<Card:0x00007fa160a62e90...>, #<Card:0x00007fa161a136f0...>]
def test_it_has_cards
  card_1 = Card.new("3","Hearts")
  card_2 = Card.new("4", "Clubs")
  card_3 = Card.new("5", "Diamonds")
  cards = [card_1, card_2, card_3]
  deck = Deck.new(cards)
  assert_equal [card_1, card_2, card_3], deck.cards
end


# pry(main)> deck.count
# #=> 3
def test_it_counts_cards
  card_1 = Card.new("3","Hearts")
  card_2 = Card.new("4", "Clubs")
  card_3 = Card.new("5", "Diamonds")
  cards = [card_1, card_2, card_3]
  deck = Deck.new(cards)
  assert_equal 3, deck.count
end


end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def test_if_card_1_exists
    card_1 = Card.new("3","Hearts")
    assert_instance_of Card , card_1
  end
# card_1 = Card.new("3","Hearts")
# #=> #<Card:0x00007fa16104e160 @suit="Hearts", @value="3">
  def test_if_card_2_exists
    card_2 = Card.new("4", "Clubs")
    assert_instance_of Card , card_2
  end
# card_2 = Card.new("4", "Clubs")
# #=> #<Card:0x00007fa160a62e90 @suit="Clubs", @value="4">
  def test_if_card_3_exists
    card_3 = Card.new("5", "Diamonds")
    assert_instance_of Card , card_3
  end
# card_3 = Card.new("5", "Diamonds")
# #=> #<Card:0x00007fa161a136f0 @suit="Diamonds", @value="5">
  def test_if_deck_exists
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    assert_instance_of Deck, deck
  end
  def test_if_deck_can_be_counted
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
  assert_equal 3 , deck.count
end

end

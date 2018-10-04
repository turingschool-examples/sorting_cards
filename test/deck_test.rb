require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def test_it_exists
    card_1 = Card.new("3", "Hearts")
    assert_instance_of Card, card_1
  end
  def test_it_exists
    card_2 = Card.new("4", "Clubs")
    assert_instance_of Card, card_2
  end
  def test_it_exists
    card_3 = Card.new("5", "Diamonds")
    assert_instance_of Card, card_3
  end

  def test_cards_is_not_empty
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    cards = [card_1, card_2, card_3]
    refute_empty cards
  end
  
  def test_it_exists
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    assert_instance_of Deck, deck
  end
end

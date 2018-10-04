require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require './lib/deck'

class DeckTest < Minitest::Test
  def test_it_exists
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    assert_instance_of Deck, deck
  end

  def test_it_has_cards
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    cards = [card_1, card_2, card_3]
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal cards, deck.cards
  end

  def test_it_has_count
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    cards = [card_1, card_2, card_3]
    deck = Deck.new([card_1, card_2, card_3])
    count = cards.size
    assert_equal 3, count
  end

end

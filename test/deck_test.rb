require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/deck'
require 'pry'

class DeckTest < Minitest::Test

  def setup
    card_1 = Card.new("5", "Spades")
    card_2 = Card.new("7", "Hearts")
    @cards = [card_1, card_2]
  end

  def test_it_exists
    deck = Deck.new(@cards)
    assert_instance_of Deck, deck
  end

  def test_it_has_cards
    deck = Deck.new(@cards)
    assert_equal 2, deck.count
  end
end

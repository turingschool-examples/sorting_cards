require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/guess'
require './lib/card'

class DeckTest < Minitest::Test

  def setup
    @card_1 = Card.new("3", "Hearts")
    @card_2 = Card.new("4", "Clubs")
    @card_3 = Card.new("5", "Diamonds")
    @cards = [@card_1, @card_2, @card_3]
  end

  def test_it_exists
    deck = Deck.new(@cards)
    assert_instance_of Deck, deck
  end

  def test_it_has_cards
    deck = Deck.new(@cards)
    assert_equal @cards, deck.cards
  end

  def test_the_count
    deck = Deck.new(@cards)
    assert_equal 3, deck.count
  end
end

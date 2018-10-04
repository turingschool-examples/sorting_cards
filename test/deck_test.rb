require './lib/card'
require './lib/deck'
require 'Minitest/autorun'
require 'minitest/pride'

class DeckTest < MiniTest::Test

  def setup
    @card_1 = Card.new("3", "Hearts")
    @card_2 = Card.new("4", "Clubs")
    @card_3 = Card.new("5", "Diamonds")
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  def test_if_deck_exists
    assert_instance_of Deck, @deck
  end

  def test_if_it_shows_cards
    assert_equal @cards, @deck.cards
  end

  def test_if_count_is_correct
    assert_equal @cards.count, @deck.count
  end
end

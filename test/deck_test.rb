require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new("Ace", "Spades")
    @card_2 = Card.new("10", "Clubs")
    @deck = Deck.new(@card_1, @card_2)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_has_cards
    assert_equal [@card_1, @card_2], @deck.cards
  end

  def test_it_returns_count_of_cards
    assert_equal 2, @deck.count
  end
end

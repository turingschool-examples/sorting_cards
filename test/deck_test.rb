require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'

class DeckTest < MiniTest::Test
  def setup
    @card_1 = Card.new("3", "Hearts")
    @card_2 = Card.new("4", "Clubs")
    @card_3 = Card.new("5", "Diamonds")
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  def test_does_it_exist
    assert_instance_of Deck, @deck
  end

  def test_it_has_cards
    assert_equal @cards, @deck.cards
  end

  def test_count_method_returns_number_of_cards
    assert_equal 3, @deck.count
  end
end

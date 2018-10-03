require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test
  def setup
    @card = Card.new("Ace", "Spades")
  end

  def test_it_exists
    assert_instance_of Card, @card
  end

  def test_it_has_a_value
    assert_equal "Ace", @card.value
  end

  def test_it_has_a_suit
    assert_equal "Spades", @card.suit
  end

  def test_another_card_works
    card = Card.new("8", "Hearts")
    assert_instance_of Card, card
    assert_equal "8", card.value
    assert_equal "Hearts", card.suit
  end
end

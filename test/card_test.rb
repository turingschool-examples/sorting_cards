require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test
  def test_it_exists
    skip
    card = Card.new("Ace", "Spades") 
    assert_instance_of Card, card
  end

  def test_it_has_a_value
    skip
    card = Card.new("Ace", "Spades")
    assert_equal "Ace", card.value
  end

  def test_it_has_a_suit

    card = Card.new("Ace", "Spades")
    assert_equal "Spades", card.suit
  end
end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test
  def test_it_exists
    card = Card.new("Ace", "Spades")
    assert_instance_of Card, card
  end

  def test_it_has_a_value
    card = Card.new("Ace", "Spades")
    assert_equal "Ace", card.value
  end

  def test_it_has_a_suit
    card = Card.new("Ace", "Spades")
    assert_equal "Spades", card.suit
  end

  def test_it_gives_a_card_a_numeric_value_for_sorting
    card_1 = Card.new("4", "Hearts")
    card_2 = Card.new("Ace", "Spades")
    assert_equal 18, card_1.ranked_value
    assert_equal 69, card_2.ranked_value
  end

end

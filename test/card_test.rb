require './test/test_helper'
require 'pry'

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

  def test_it_can_calculate_value_weight
    assert_equal 13, @card.calculate_value_weight("Ace")
  end

  def test_it_can_calculate_suit_weight
    assert_equal 4, @card.calculate_suit_weight("Spades")
  end

  def test_it_can_calculate_total_weight
    assert_equal 52, @card.calculate_total_weight("Ace", "Spades")
  end

  def test_it_has_correct_card_weight
    assert_equal 52, @card.card_weight
  end
end

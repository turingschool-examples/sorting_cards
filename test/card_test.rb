require './test/test_helper'

class CardTest < Minitest::Test
  def setup
    @card = Card.new("Ace", "Spades")
  end

  def test_it_exists
    assert_instance_of Card, @card
  end

  def test_it_has_a_value
    assert_equal "ace", @card.value
  end

  def test_it_can_have_any_value
    card2 = Card.new("Queen", "Hearts")

    assert_equal "queen", card2.value
  end

  def test_it_has_a_suit
    assert_equal "spades", @card.suit
  end

  def test_it_can_have_any_suit
    card2 = Card.new("Queen", "Hearts")

    assert_equal "hearts", card2.suit
  end

  def test_it_returns_error_if_data_is_not_string
    assert_raises ArgumentError do  
      Card.new(4, 7)
    end

    assert_raises ArgumentError do  
      Card.new("4", 7)
    end

    assert_raises ArgumentError do  
      Card.new(4, "7")
    end
  end

  def test_it_can_calculate_value_weight
    assert_equal 13, @card.calculate_value_weight("Ace")
  end

  def test_it_can_calculate_suit_weight
    assert_equal 4, @card.calculate_suit_weight("Spades")
  end

  def test_it_can_calculate_total_weight
    assert_equal 13.4, @card.calculate_total_weight("Ace", "Spades")
  end

  def test_it_has_correct_card_weight
    assert_equal 13.4, @card.card_weight
  end
end

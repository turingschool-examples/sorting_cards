require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

## ========== Card Values ===============
# jack: 11,
# queen: 12,
# king: 13,
# ace: 14
## ========== Card Suit Values ==========
# clubs: 0,
# diamonds: 1,
# hearts: 2,
# spades: 3
## ======================================

class CardTest < Minitest::Test
  def setup
    @card = Card.new("Ace", "Spades")
    @card_2 = Card.new("Ace", "Clubs")
    @card_3 = Card.new("Jack", "Hearts")
    @card_4 = Card.new("3", "Clubs")
    @card_5 = Card.new("Jack", "Clubs")
    @card_6 = Card.new("Jack", "Clubs")
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

  def test_spaceship_returns_one_if_self_is_greater_than_other_by_value
    assert_equal 1, @card_5 <=> @card_4
  end

  def test_spaceship_returns_one_if_self_is_greater_than_other_by_suit
    assert_equal 1, @card <=> @card_2
  end

  def test_spaceship_returns_zero_if_self_is_equal_to_other_by_value_and_suit
    assert_equal 0, @card_5 <=> @card_6
  end

  def test_spaceship_returns_negative_one_if_self_is_less_than_other_by_value
    assert_equal (-1), @card_4 <=> @card_5
  end

  def test_spaceship_returns_negative_one_if_self_is_less_than_other_by_suit
    assert_equal (-1), @card_2 <=> @card
  end

  def test_it_returns_true_if_self_is_less_than_or_equal_by_value
    assert @card_4 <= @card_5
  end

  def test_it_returns_true_if_self_is_less_than_or_equal_by_suit
    assert @card_2 <= @card
  end

  def test_it_returns_true_if_self_is_greater_than_or_equal_by_value
    assert @card_5 >= @card_4
  end

  def test_it_returns_true_if_self_is_less_than_or_equal_by_suit
    assert @card >= @card_2
  end

  def test_it_compares_by_value_less_than
    assert @card_4 < @card_3
  end

  def test_it_compares_by_value_greater_than
    assert @card_3 > @card_4
  end

  def test_it_compares_by_suit_less_than
    assert @card_2 < @card
  end

  def test_compares_by_suit_greater_than
    assert @card > @card_2
  end

  def test_it_standardizes_card_special_value
    assert_equal 14, @card.standardize_card_attribute(@card.value)
  end

  def test_it_standardizes_card_value
    assert_equal 3, @card_4.standardize_card_attribute(@card_4.value)
  end

  def test_it_standardizes_card_suit
    assert_equal 3, @card.standardize_card_attribute(@card.suit)
  end

  def test_it_standardizes_values_of_self_and_other_card
    expected = [14, 14]

    assert_equal expected, @card.standardize_all_values(@card_2.value)
  end

  def test_it_standardizes_suits_of_self_and_other_card
    expected = [3, 0]

    assert_equal expected, @card.standardize_all_suits(@card_2.suit)
  end

  def test_it_can_check_if_value_is_special_and_return_true
    assert @card.special_value?(@card.value)
  end

  def test_it_can_check_if_value_is_special_and_return_false
    refute @card_4.special_value?(@card_4.value)
  end

  def test_it_can_check_if_value_is_a_suit_and_return_true
    assert @card.suit?(@card.suit)
  end

  def test_it_can_check_if_value_is_a_suit_and_return_false
    refute @card.suit?(@card.value)
  end
end

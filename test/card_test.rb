require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test
  def setup
    @card = Card.new("Ace", "Spades")
    @card_2 = Card.new("Ace", "Clubs")
    @card_3 = Card.new("Jack", "Hearts")
    @card_4 = Card.new("3", "Clubs")
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

  def test_it_compares_by_value_less_than

  end

  def test_it_compares_by_value_greater_than

  end

  def test_it_compares_by_suit_less_than

  end

  def test_compares_by_suit_greater_than

  end
end

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

  def test_number_card_value_is_a_number
    card_1 = Card.new("Ace", "Spades")
    card_2 = Card.new("3", "Diamonds")
    assert_equal 130, card_1.number_card_value
    assert_equal 20, card_2.number_card_value
  end

  def test_number_card_suit_is_a_number
     card_1 = Card.new("Ace", "Spades")
     card_2 = Card.new("3", "Diamonds")
     assert_equal 4, card_1.number_card_suit
     assert_equal 2, card_2.number_card_suit
  end
  
  def test_total_value_of_card
    card_1 = Card.new("Ace", "Spades")
    card_2 = Card.new("3", "Diamonds")
    assert_equal 134, card_1.total_value
    assert_equal 22, card_2.total_value
  end

end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test
  def test_it_exists
    # skip
    card = Card.new('Ace', 'Spades')
    assert_instance_of Card, card
  end

  def test_it_has_a_value
    # skip
    card = Card.new('Ace', 'Spades')
    assert_equal 'Ace', card.value
  end

  def test_it_has_a_suit
    # skip
    card = Card.new('Ace', 'Spades')
    assert_equal 'Spades', card.suit
  end

  def test_parse_from_string
    card1 = Card.new('Ace', 'Spades')
    card2 = Card.parse('Ace of Spades')
    assert_equal card1.to_s, card2.to_s
  end

  def test_to_string
    card = Card.new('Ace', 'Spades')
    assert_equal card.to_s, 'Ace of Spades'
  end
end

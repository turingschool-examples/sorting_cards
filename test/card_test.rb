require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test
  def setup
    @card = Card.new('Ace', 'Spades')
  end

  def test_it_exists
    # skip
    assert_instance_of Card, @card
  end

  def test_it_has_a_value
    # skip
    assert_equal 'Ace', @card.value
  end

  def test_it_has_a_suit
    # skip
    assert_equal 'Spades', @card.suit
  end

  def test_parse_from_string
    card2 = Card.parse('Ace of Spades')
    assert_equal @card.to_s, card2.to_s
  end

  def test_to_string
    assert_equal @card.to_s, 'Ace of Spades'
  end
end

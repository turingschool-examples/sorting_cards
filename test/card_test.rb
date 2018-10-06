require_relative 'test_helper'
require_relative '../lib/card'



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

  def test_to_f
    assert_equal 14.4, @card.to_f
  end

  def test_from_f
    card = Card.from_f(11.1)
    assert_equal 'Clubs', card.suit
    assert_equal 'Jack', card.value
  end



end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require 'pry'

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

  def it_has_a_valuation
    card = Card.new("Ace", "Spades")
    assert_equal 144, card.valuation
  end
end

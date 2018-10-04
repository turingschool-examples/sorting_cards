require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("3","Hearts")
    @card_2 = Card.new("4", "Clubs")
    @card_3 = Card.new("5", "Diamonds")
    @test_cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@test_cards)
  end

  def test_it_exists
    subject = Round.new(@deck)
    assert_instance_of Round, subject
  end

  def test_it_has_a_value
    skip
    card = Card.new("Ace", "Spades")
    assert_equal "Ace", card.value
  end

  def test_it_has_a_suit
    skip
    card = Card.new("Ace", "Spades")
    assert_equal "Spades", card.suit
  end
end

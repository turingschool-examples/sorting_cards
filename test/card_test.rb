require './test/helper'

class CardTest < Minitest::Test

  def setup
    @card = Card.new("Ace", "Spades")
    @card_2 = Card.new("4", "Clubs")
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

  def test_it_can_rank_cards
    assert_equal 53, @card.rank
    assert_equal 10, @card_2.rank
  end
end

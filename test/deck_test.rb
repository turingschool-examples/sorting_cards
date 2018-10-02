require './test/helper'

class DeckTest < Minitest::Test

  def setup
    @card_1 = Card.new("3","Hearts")
    @card_2 = Card.new("4", "Clubs")
    @card_3 = Card.new("5", "Diamonds")
    @cards = [@card_1, @card_2, @card_3]
    @deck   = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_returns_an_array_of_card_objects
    assert_equal [@card_1, @card_2, @card_3], @deck.cards
  end

  def test_it_can_count_the_number_of_cards
    assert_equal 3, @deck.count
  end

end

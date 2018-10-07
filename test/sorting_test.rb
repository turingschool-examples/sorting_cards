require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'


class SortingTest < Minitest::Test
  def setup
    @card_1 = Card.new("4","Hearts")
    @card_2 = Card.new("Ace", "Spades")
    @card_3 = Card.new("5", "Diamonds")
    @card_4 = Card.new("Jack", "Clubs")
    @card_5 = Card.new("Ace", "Diamonds")
    @deck = Deck.new([@card_1, @card_2, @card_3, @card_4, @card_5])
  end

  # BUBBLE SORT
  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_has_ordered_values_that_exist
skip

  end

  # test_the_order_of_suits_exists


  # test_it_iterates_through_values
  # test_it_iterates_through_suits

end

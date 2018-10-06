require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/guess'
require './lib/round'
require './lib/sorter'
require 'pry'

class SorterTest < Minitest::Test
  def setup
    @card_1 = Card.new("4","Hearts")
    @card_2 = Card.new("Ace", "Spades")
    @card_3 = Card.new("5", "Diamonds")
    @card_4 = Card.new("Jack", "Clubs")
    @card_5 = Card.new("Ace", "Diamonds")
    @deck = Deck.new([@card_1, @card_2, @card_3, @card_4, @card_5])
    @sorter = Sorter.new(@deck)
  end

  def test_it_exists
    assert_instance_of Sorter, @sorter
  end

  def test_it_holds_a_starting_card_array
    assert_equal @deck.cards, @sorter.starting_cards
  end

  def test_it_creates_a_working_array
    assert_instance_of Array, @sorter.create_working_array
  end

  def test_it_creates_a_sort_value_array
    assert_instance_of Array, @sorter.map_sort_values
  end

  def test_my_sort_returns_cards_in_proper_order
    proper_order = [@card_1, @card_3, @card_4, @card_5, @card_2]
    assert_equal proper_order, @sorter.sort
  end

  def test_mergesort_returns_cards_in_proper_order
    proper_order = [@card_1, @card_3, @card_4, @card_5, @card_2]
    assert_equal proper_order, @sorter.mergesort
  end
end #RoundTest Class

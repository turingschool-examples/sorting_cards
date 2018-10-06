# sorter_test.rb

require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/sorter.rb'

class SorterTest < Minitest::Test
  def setup
    @card_1 = Card.new("4","Hearts")
    @card_2 = Card.new("Ace", "Spades")
    @card_3 = Card.new("5", "Diamonds")
    @card_4 = Card.new("Jack", "Clubs")
    @card_5 = Card.new("Ace", "Diamonds")
    @deck = Deck.new([@card_1, @card_2, @card_3, @card_4, @card_5])
    @sorter = Sorter.new([@card_1, @card_2, @card_3, @card_4, @card_5])
  end

  def test_it_exists
    assert_instance_of Sorter, @sorter
  end

  def test_it_values_deck
    values = {@card_1 => [2, 2], @card_2 => [12, 3], @card_3 => [3, 1],
              @card_4 => [9, 0], @card_5 => [12, 1]}
    assert_equal values, @sorter.value_deck
  end

  def test_it_sorts
    assert_equal [@card_1, @card_3, @card_4, @card_5, @card_2], @deck.sort
  end




end

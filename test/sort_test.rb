require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require 'pry'

class SortTest < Minitest::Test

  def test_card_sum_is_accurate
    card_1 = Card.new("4", "Hearts")
    card_2 = Card.new("Ace", "Spades")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Jack", "Clubs")
    card_5 = Card.new("Ace", "Diamonds")
    cards = [card_1, card_2, card_3, card_4, card_5]
    assert_equal 303, cards[0].card_sum
    assert_equal 1304, cards[1].card_sum
    assert_equal 402, cards[2].card_sum
    assert_equal 1001, cards[3].card_sum
    assert_equal 1302, cards[4].card_sum
  end

  def test_sort_is_operational_on_deck

    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Ace", "Spades")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Jack", "Clubs")
    card_5 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
    assert_equal [card_1, card_3, card_4, card_5, card_2], deck.sort
  end
end

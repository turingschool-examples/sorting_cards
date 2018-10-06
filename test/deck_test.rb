require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new("Ace", "Spades")
    @card_2 = Card.new("10", "Clubs")
    @card_3 = Card.new("2", "Hearts")
    @card_4 = Card.new("King", "Hearts")
    @card_5 = Card.new("King", "Diamonds")
    @deck = Deck.new(@card_1, @card_2)
    @deck_2 = Deck.new(@card_1, @card_2, @card_3, @card_4, @card_5)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_has_cards
    assert_equal [@card_1, @card_2], @deck.cards
  end

  def test_it_returns_count_of_cards
    assert_equal 2, @deck.count
  end

  def test_it_sorts_a_deck_ascending
    current = [@card_1, @card_2, @card_3, @card_4, @card_5]
    expected = [@card_3, @card_2, @card_5, @card_4, @card_1]

    assert_equal current, @deck_2.cards

    @deck_2.sort
    assert_equal expected, @deck_2.cards
  end

  def test_it_sorts_a_deck_descending
    current = [@card_1, @card_2, @card_3, @card_4, @card_5]
    expected = [@card_1, @card_4, @card_5, @card_2, @card_3]
    assert_equal current, @deck_2.cards

    @deck_2.sort(reverse: true)
    assert_equal expected, @deck_2.cards
  end

  def test_it_sorts_a_deck_ascending_merge_sort
    current = [@card_1, @card_2, @card_3, @card_4, @card_5]
    expected = [@card_3, @card_2, @card_5, @card_4, @card_1]

    assert_equal current, @deck_2.cards

    @deck_2.merge_sort
    assert_equal expected, @deck_2.cards
  end

  def test_it_sorts_a_deck_descending_merge_sort
    current = [@card_1, @card_2, @card_3, @card_4, @card_5]
    expected = [@card_1, @card_4, @card_5, @card_2, @card_3]
    assert_equal current, @deck_2.cards

    @deck_2.sort(reverse: true)
    assert_equal expected, @deck_2.cards
  end

  def test_it_returns_string_if_trying_to_merge_sort_array_less_than_three
    assert_equal "Use another method", @deck.merge_sort
  end
end

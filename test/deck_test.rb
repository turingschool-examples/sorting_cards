require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require 'pry'

## ========== Card Values ===============
# jack: 11,
# queen: 12,
# king: 13,
# ace: 14
## ========== Card Suit Values ==========
# clubs: 0,
# diamonds: 1,
# hearts: 2,
# spades: 3
## ======================================

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
  ## ==========
  # bubble sort and helper methods tests
  ## ==========
  def test_it_swaps_for_bubble_sort_ascending
    expected = [@card_1, @card_2, @card_3, @card_4, @card_5]
    assert_equal expected, @deck_2.cards

    i = 0
    expected = [@card_2, @card_1, @card_3, @card_4, @card_5]
    @deck_2.check_for_swap(i)
    assert_equal expected, @deck_2.cards
  end

  def test_it_swaps_for_bubble_sort_descending
    expected = [@card_1, @card_2, @card_3, @card_4, @card_5]
    assert_equal expected, @deck_2.cards

    i = 2
    expected = [@card_1, @card_2, @card_4, @card_3, @card_5]
    @deck_2.check_for_swap(i, true)
    assert_equal expected, @deck_2.cards
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
  ## ==========
  # merge sort and helper methods tests
  ## ==========

  def test_it_sorts_an_array_of_two_ascending
    array = [@card_1, @card_2]
    expected = [@card_2, @card_1]
    direction = {reverse: false}

    assert_equal expected, @deck.sort_array(array, direction)
  end

  def test_it_sorts_an_array_of_two_descending
    array = [@card_2, @card_1]
    expected = [@card_1, @card_2]
    direction = {reverse: true}

    assert_equal expected, @deck.sort_array(array, direction)
  end

  def test_it_splits_an_array_and_sorts_each_ascending
    array = [@card_2, @card_3, @card_4, @card_5, @card_1]
    expected = [[@card_3, @card_2],[@card_5, @card_4]]
    direction = {reverse: false}

    assert_equal expected, @deck.split_array(array, direction)
  end

  def test_it_splits_an_array_and_sorts_each_descending
    array = [@card_3, @card_2, @card_5, @card_4, @card_1]
    expected = [[@card_2, @card_3],[@card_4, @card_5]]
    direction = {reverse: true}

    assert_equal expected, @deck.split_array(array, direction)
  end

  def test_it_pushes_to_sorted_when_sorted_is_empty_ascending
    sorted = []
    array_a = [@card_3, @card_2]
    array_b = [@card_5, @card_4]
    direction = {reverse: false}

    expected = [@card_3, @card_2, @card_5, @card_4]
    sorted = @deck.push_or_merge_to_sorted(sorted, array_a, array_b, direction)

    assert_equal expected, sorted
  end

  def test_it_pushes_to_sorted_when_sorted_is_empty_descending
    sorted = []
    array_a = [@card_2, @card_3]
    array_b = [@card_4, @card_5]
    direction = {reverse: true}

    expected = [@card_4, @card_5, @card_2, @card_3]
    sorted = @deck.push_or_merge_to_sorted(sorted, array_a, array_b, direction)

    assert_equal expected, sorted
  end

  def test_it_merges_to_sorted_when_sorted_is_not_empty_ascending
    sorted = [@card_3]
    array_a = [@card_3, @card_2]
    array_b = [@card_4, @card_5]
    direction = {reverse: false}

    expected = [@card_4, @card_5, @card_2, @card_3]
    sorted = @deck.push_or_merge_to_sorted(sorted, array_a, array_b, direction)

    assert_equal expected, sorted
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

    @deck_2.merge_sort(reverse: true)
    assert_equal expected, @deck_2.cards
  end

  def test_it_returns_string_if_trying_to_merge_sort_array_less_than_three
    assert_equal "Use another method", @deck.merge_sort
  end
end

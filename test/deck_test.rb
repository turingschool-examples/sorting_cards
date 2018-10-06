require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/guess.rb'
require './lib/deck.rb'

class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new("Ace", "Spades")
    @card_2 = Card.new("8", "Diamonds")
    @card_3 = Card.new("2", "Clubs")
    @card_4 = Card.new("8", "Hearts")
    @card_5 = Card.new("8", "Clubs")
    @card_6 = Card.new("8", "Spades")
    @card_7 = Card.new("Queen", "Spades")
    @card_8 = Card.new("King", "Spades")
    @card_9 = Card.new("Jack", "Spades")

    @cards = [@card_1, @card_2, @card_3, @card_4, @card_5, @card_6,
      @card_7, @card_8, @card_9]
    @deck = Deck.new(@cards)

    @oa_value_and_cards = @deck.sort_setup
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_returns_cards
    assert_equal @cards, @deck.cards
  end

  def test_it_can_count_the_cards
    assert_equal 9, @deck.count
  end

  def test_it_can_bubble_sort_the_cards
    sorted_deck = [@card_3, @card_5, @card_2, @card_6, @card_4,
      @card_9, @card_7, @card_8, @card_1]
    assert_equal sorted_deck, @deck.sort
  end

  def test_it_can_merge_sort_the_cards
    sorted_deck = [@card_3, @card_5, @card_2, @card_6, @card_4,
      @card_9, @card_7, @card_8, @card_1]
    assert_equal sorted_deck, @deck.sort("merge sort")
  end

  def test_it_can_brute_force_sort_the_cards #runs in .07s with 9 cards
    # do not run for more than 11 cards; runs O(n!) worst case
    sorted_deck = [@card_3, @card_5, @card_2, @card_6, @card_4,
      @card_9, @card_7, @card_8, @card_1]
    assert_equal sorted_deck, @deck.sort("bogo sort")
  end

  def test_it_can_setup_for_sort
    expected_oa_value_and_cards = [[@card_1.overall_value, @card_1],
      [@card_2.overall_value, @card_2], [@card_3.overall_value, @card_3],
      [@card_4.overall_value, @card_4], [@card_5.overall_value, @card_5],
      [@card_6.overall_value, @card_6], [@card_7.overall_value, @card_7],
      [@card_8.overall_value, @card_8], [@card_9.overall_value, @card_9]]
    assert_equal expected_oa_value_and_cards, @oa_value_and_cards
  end

  def test_it_can_teardown_for_sort
    assert_equal @cards, @deck.sort_teardown(@oa_value_and_cards)
  end

  def test_it_can_return_correct_order?
    sorted_deck_oa_value_card = [[@card_3.overall_value, @card_3],
      [@card_5.overall_value, @card_5], [@card_2.overall_value, @card_2],
      [@card_6.overall_value, @card_6], [@card_4.overall_value, @card_4],
      [@card_9.overall_value, @card_9], [@card_7.overall_value, @card_7],
      [@card_8.overall_value, @card_8], [@card_1.overall_value, @card_1]]

    assert_equal true, @deck.correct_order?(sorted_deck_oa_value_card)
    assert_equal false, @deck.correct_order?(@oa_value_and_cards)
  end

  def test_it_can_switch_cards
    expected_oa_value_and_cards = [[@card_1.overall_value, @card_1],
      [@card_3.overall_value, @card_3], [@card_2.overall_value, @card_2],
      [@card_4.overall_value, @card_4], [@card_5.overall_value, @card_5],
      [@card_6.overall_value, @card_6], [@card_7.overall_value, @card_7],
      [@card_8.overall_value, @card_8], [@card_9.overall_value, @card_9]]
    two_cards = [[@card_2.overall_value, @card_2], [@card_3.overall_value, @card_3]]
    i = 1
    assert_equal expected_oa_value_and_cards, @deck.switch_cards(@oa_value_and_cards, i, two_cards)
  end

  def test_it_can_pull_cards_to_compare
    expected_oa_value_and_cards = [[@card_2.overall_value, @card_2],
      [@card_3.overall_value, @card_3]]
    i = 1
    assert_equal expected_oa_value_and_cards, @deck.cards_to_compare(@oa_value_and_cards, i)
  end

  def test_it_can_tell_if_merged_arrays
    a = [[1, 2], [3, 4]]
    b = [[1, 2, 3, 4]]
    assert_equal false, @deck.merged?(a)
    assert_equal true, @deck.merged?(b)
  end

  def test_it_can_merge_two_arrays
    ary = [[1, 5], [3, 4, 6]]
    expected = [[1, 5, 3, 4, 6]]
    assert_equal expected, @deck.merge_arrays(ary)
  end

  def test_it_can_merge_two_lists_in_order
    list_1 = [[1, @card_1], [3, @card_3]]
    list_2 = [[2, @card_2], [5, @card_5], [6, @card_6]]
    expected = [[1, @card_1], [2, @card_2], [3, @card_3], [5, @card_5], [6, @card_6]]
    assert_equal expected, @deck.merge(list_1, list_2)
  end

  def test_it_can_continue_to_merge_two_list_when_one_is_empty
    merged_list = [[2, @card_2]]
    list_1 = []
    list_2 = [[5, @card_5], [6, @card_6]]
    expected = [[2, @card_2], [5, @card_5], [6, @card_6]]
    assert_equal expected, @deck.merge_remainder(merged_list, list_1, list_2)
  end

end

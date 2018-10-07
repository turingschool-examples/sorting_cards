require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/merge_sorter'
require 'pry'

class MergeSorterTest < Minitest::Test

  def setup
    @card_1 = Card.new("4","Hearts")
    @card_2 = Card.new("Ace", "Spades")
    @card_3 = Card.new("5", "Diamonds")
    @card_4 = Card.new("Jack", "Clubs")
    @card_5 = Card.new("Ace", "Diamonds")
    @cards = [@card_1, @card_2, @card_3, @card_4, @card_5]
    @merge_sorter = MergeSorter.new(@cards)
  end

  def test_it_exists
    assert_instance_of MergeSorter, @merge_sorter
  end

  def test_it_scores_cards
    scored_cards = [[@card_1, 2.2], [@card_2, 12.3],
                    [@card_3, 3.1], [@card_4, 9.0], [@card_5, 12.1]]

    assert_equal scored_cards, @merge_sorter.score_cards(@cards)
  end

  def test_it_merge_sorts_cards
    expected = [@card_1, @card_3, @card_4, @card_5, @card_2]
    assert_equal expected, @merge_sorter.merge_sort_and_resolve
  end

  def test_it_merges_cards
    merge_sorter = MergeSorter.new([@card_3, @card_1, @card_4, @card_5])
    expected = [[@card_1, 2.2], [@card_3, 3.1], [@card_4, 9.0],
                [@card_5, 12.1]]
    actual = @merge_sorter.merge([[@card_3, 3.1], [@card_4, 9.0]],
                                [[@card_1, 2.2], [@card_5, 12.1]])
    assert_equal expected, actual
  end

  def test_it_merges_uneven_cards
    expected = [[@card_1, 2.2], [@card_3, 3.1], [@card_4, 9.0],
                [@card_5, 12.1], [@card_2, 12.3]]
    actual = @merge_sorter.merge([[@card_3, 3.1], [@card_4, 9.0], [@card_2, 12.3]],
                                [[@card_1, 2.2], [@card_5, 12.1]])
    assert_equal expected, actual
  end


  def test_it_sorts # use deck for this?
    deck = Deck.new(@cards)
    expected = [@card_1, @card_3, @card_4, @card_5, @card_2]

    assert_equal expected, deck.merge_sort
  end

end

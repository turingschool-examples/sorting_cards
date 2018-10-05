require_relative 'test_helper'
require_relative '../lib/card'
require_relative '../lib/deck'



class CardTest < Minitest::Test
  def help_setup_deck_config1
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Ace", "Spades")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Jack", "Clubs")
    card_5 = Card.new("Ace", "Diamonds")
    @deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
    @expected = [card_1, card_3, card_4, card_5, card_2]
  end

  def help_setup_deck_config2
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("4", "Spades")
    card_3 = Card.new("4", "Diamonds")
    card_4 = Card.new("4", "Clubs")
    card_5 = Card.new("Ace", "Diamonds")
    @deck = Deck.new([card_4, card_3, card_1, card_2, card_5])
    @expected = [card_4, card_3, card_1, card_2, card_5]
  end

  def help_setup_standard_deck
  end

  def help_test_against_merge_sort

  end

  def test_sort
    help_setup_deck_config1
    assert_equal @expected, @deck.sort
    help_setup_deck_config2
    assert_equal @expected, @deck.sort
  end

  def test_bubble_sort

    help_setup_deck_config1
    assert_equal @expected, @deck.bubble_sort
    help_setup_deck_config2
    assert_equal @expected, @deck.bubble_sort
  end

  def test_merge_sort
    help_setup_deck_config1
    assert_equal @expected, @deck.merge_sort
    help_setup_deck_config2
    assert_equal @expected, @deck.merge_sort
  end

end

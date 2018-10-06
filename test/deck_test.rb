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
    sorted_deck = [@card_3, @card_5, @card_2, @card_6, @card_4,
      @card_9, @card_7, @card_8, @card_1]
    assert_equal sorted_deck, @deck.sort("BRUTE FORCE!!!")
  end

end

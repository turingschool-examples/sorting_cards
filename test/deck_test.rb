require './test/test_helper'

class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new("4","Hearts")
    @card_2 = Card.new("Ace", "Spades")
    @card_3 = Card.new("5", "Diamonds")
    @card_4 = Card.new("Jack", "Clubs")
    @card_5 = Card.new("Ace", "Diamonds")
    @deck = Deck.new([@card_1, @card_2, @card_3, @card_4, @card_5])
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_holds_an_array_of_cards
    assert_equal [@card_1, @card_2, @card_3, @card_4, @card_5], @deck.cards
  end

  def test_it_returns_error_if_data_is_not_array
    assert_raises ArgumentError do  
      Deck.new("cards")
    end
  end

  def test_it_counts_cards_in_deck
    assert_equal 5, @deck.count
  end

  def test_it_sorts_cards
    assert_equal [@card_1, @card_3, @card_4, @card_5, @card_2],  @deck.merge_sort
  end
  
  def test_it_merge_sorts_cards
    assert_equal [@card_1, @card_3, @card_4, @card_5, @card_2],  @deck.merge_sort
  end
end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require 'pry'

class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new("3", "Hearts")
    @card_2 = Card.new("4", "Clubs")
    @card_3 = Card.new("5", "Diamonds")
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_holds_cards
    assert_equal @cards, @deck.cards
  end

  def test_it_counts_cards
    assert_equal 3, @deck.count
  end

  def test_it_holds_expected_card_values
    index_counter = 0
    max_count = @deck.cards.length - 1
    while index_counter <= max_count
      assert_equal @cards[index_counter], @deck.cards[index_counter]
      index_counter += 1
    end
  end

end #DeckTest Class

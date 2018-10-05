require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require 'pry'

class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new("3","Hearts")
    @card_2 = Card.new("4", "Clubs")
    @card_3 = Card.new("5", "Diamonds")
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_has_cards
    @deck.cards
    assert_equal @cards, [@card_1, @card_2, @card_3]
    binding.pry
    assert_instance_of @deck, @cards
  end

  def test_command_counts
  @deck.count
  assert_equal 3, @deck.count
  end

end

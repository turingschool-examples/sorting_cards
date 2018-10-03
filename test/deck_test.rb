require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/guess.rb'
require './lib/deck.rb'

class DeckTest < Minitest::Test
  def setup
    card_1 = Card.new("Ace", "Spades")
    card_2 = Card.new("8", "Diamonds")
    card_3 = Card.new("2", "Clubs")
    @cards = [card_1, card_2, card_3]
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_returns_cards
    assert_equal @cards, @deck.cards
  end

  def test_it_can_count_the_cards
    assert_equal 3, @deck.count
  end

end

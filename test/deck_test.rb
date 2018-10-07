require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require 'pry'

class CardTest < Minitest::Test
  def setup
    card_1 = Card.new('Jack', 'Clubs')
    card_2 = Card.new('5', 'Diamonds')
    card_3 = Card.new('Ace', 'Diamonds')
    card_4 = Card.new('4', 'Hearts')
    card_5 = Card.new('Ace', 'Spades')

    @cards = [card_1, card_2, card_3, card_4, card_5]
    @deck = Deck.new(@cards)
  end

  def test_deck_count
    # skip
    assert_equal 5, @deck.count
  end

  def test_sort
    shuffled = @deck.shuffle
    expected = @cards
    # binding.pry
    actual = Deck.sortBubbleRank(shuffled)
    # binding.pry
    assert_equal expected, actual
  end
end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require "./lib/card"

class DeckTest < Minitest::Test

  def setup
    @card_1 = Card.new("3","Hearts") #23
    @card_2 = Card.new("4", "Diamonds") #32
    @card_3 = Card.new("2", "Clubs") #11
    @card_4 = Card.new("Queen", "Spades") #114
    @test_cards = [@card_1, @card_2, @card_3, @card_4]
  end

  def test_it_exists
    skip
    subject = Deck.new(@test_cards)
    assert_instance_of Deck, subject
  end

  def test_it_has_cards
    skip
    subject = Deck.new(@test_cards)
    assert_equal subject.cards, @test_cards
  end

  def test_it_counts
    skip
    subject = Deck.new(@test_cards)
    assert_equal subject.count, @test_cards.count
  end

  def test_cards_have_indipendent_values
    skip
    subject = Deck.new(@test_cards)
    assert_equal @test_cards[0].total_value, 23
  end

  def test_it_sorts
    subject = Deck.new(@test_cards)
    expected = [@card_3, @card_1, @card_2, @card_4]
    assert_equal expected , subject.sort
  end
end

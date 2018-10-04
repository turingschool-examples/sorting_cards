require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require "pry"
class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new("3","Hearts")
    @card_2 = Card.new("4", "Clubs")
    @card_3 = Card.new("5", "Diamonds")
    @test_cards = [@card_1, @card_2, @card_3]

  end
  def test_it_exists
    subject = Deck.new(@test_cards)
    assert_instance_of Deck, subject
  end
  def test_it_has_cards
    subject = Deck.new(@test_cards)
    assert_equal subject.cards, @test_cards

  end
  def test_it_counts
    subject = Deck.new(@test_cards)
    assert_equal subject.count, @test_cards.count
  end

end

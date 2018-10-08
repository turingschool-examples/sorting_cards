require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'
require './lib/guess'
require './lib/card'
require './lib/deck'
require 'pry'

class DeckTest < MiniTest::Test
    def test_it_exists
      card_1 = Card.new("3","Hearts")
      card_2 = Card.new("4", "Clubs")
      card_3 = Card.new("5", "Diamonds")
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      assert_instance_of Deck, deck
    end

    def test_it_has_cards
      card_1 = Card.new("3","Hearts")
      card_2 = Card.new("4", "Clubs")
      card_3 = Card.new("5", "Diamonds")
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      assert_equal cards, deck.cards
    end

    def test_it_can_count
      card_1 = Card.new("3","Hearts")
      card_2 = Card.new("4", "Clubs")
      card_3 = Card.new("5", "Diamonds")
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      assert_equal 3, deck.count
    end

    def test_it_can_sort_cards
      card_1 = Card.new("4","Hearts")
      card_2 = Card.new("Ace", "Spades")
      card_3 = Card.new("5", "Diamonds")
      card_4 = Card.new("Jack", "Clubs")
      card_5 = Card.new("Ace", "Diamonds")
      deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
      expected = [card_1, card_3, card_4, card_5, card_2]
      assert_equal expected, deck.sort
    end

    def test_it_knows_when_the_deck_is_sorted
      card_1 = Card.new("4","Hearts")
      card_2 = Card.new("Ace", "Spades")
      card_3 = Card.new("5", "Diamonds")
      card_4 = Card.new("Jack", "Clubs")
      card_5 = Card.new("Ace", "Diamonds")
      deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
      deck.sort
      assert deck.sorted?
    end

end

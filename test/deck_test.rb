require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def test_it_exists
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    assert_instance_of Deck, deck
  end

  def test_cards_method_returns_all_cards
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    assert_equal cards, deck.cards
    assert_equal 3, deck.count
  end

  def test_it_can_sort_the_deck
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Ace", "Spades")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Jack", "Clubs")
    card_5 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_3, card_1, card_5, card_2, card_4])
    sorted = [card_1, card_3, card_4, card_5, card_2]
    assert_equal sorted, deck.sort
  end

  def test_it_can_create_random_card_from_deck
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Ace", "Spades")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Jack", "Clubs")
    card_5 = Card.new("Ace", "Diamonds")
    card_6 = Card.new("King", "Hearts")
    card_7 = Card.new("10", "Clubs")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6, card_7])
    assert_instance_of Card, deck.random_card
  end
end

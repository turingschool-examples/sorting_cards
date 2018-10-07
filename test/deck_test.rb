require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require './lib/deck'

class DeckTest < Minitest::Test
  #test initialization of the method
  def test_initial_call
    card_1 = Card.new("3", "Hearts") ## use setup next time for ease of access 
    card_2 = Card.new("7", "Clubs")
    card_3 = Card.new("Ace", "Spades")
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  #test deck.cards response
  def test_deck_cards_method
  card_1 = Card.new("3", "Hearts")
  card_2 = Card.new("7", "Clubs")
  card_3 = Card.new("Ace", "Spades")
  cards = [card_1, card_2, card_3]
  deck = Deck.new(cards)

  assert_equal cards, deck.cards
  end
  #test deck.count response
  def test_deck_count_method
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("7", "Clubs")
    card_3 = Card.new("Ace", "Spades")
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    assert_equal deck.count, cards.length
  end

end

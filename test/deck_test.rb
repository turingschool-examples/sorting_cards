require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/guess'
require './lib/card'

class Deck < Minitest::Test
  def test_it_exists
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    card_1 = Deck.new("3", "Hearts")
    card_2 = Deck.new("4", "Clubs")
    card_3 = Deck.new("5", "Diamonds")
    assert_equal guess.card, card
    assert_equal card_1.guess, card
    assert_equal card_2.guess, card
    assert_equal card_3.guess, card
  end
end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/guess'

class RoundTest < MiniTest::Test
  # test for initializationd
  def test_round_initialization
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("7", "Clubs")
    card_3 = Card.new("Ace", "Spades")
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    round = Round.new(deck)

    assert_instance_of Round, round
  end
  # test .deck is returned to round
  def test_deck_method
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("7", "Clubs")
    card_3 = Card.new("Ace", "Spades")
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    round = Round.new(deck)

    assert_equal round.deck, deck
  end


  # test .guesses returns empty array
  def test_guesses_is_empty_array
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("7", "Clubs")
    card_3 = Card.new("Ace", "Spades")
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    round = Round.new(deck)


    assert_equal round.guesses, []
  end


  # test current card returns the current round value

  def test_current_card_returns_roundvalue
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("7", "Clubs")
    card_3 = Card.new("Ace", "Spades")
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    assert_equal round.current_card, card_1

  end
  # test record guess outputs a hash that us pushed to card +
  ## (and to the guesses)
  def test_record_guess_functionality
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("7", "Clubs")
    card_3 = Card.new("Ace", "Spades")
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})
    # guess = Guess.new("10 of Hearts", card_1)


    assert_instance_of Guess, new_guess
    assert_equal new_guess.class, Guess
    assert_equal new_guess.correct?, true
    #assert_equal new_guess.number_correct, 1
  end

  # test new guess is an instance of Guess class
  # test new guess correct?
  def
  # test guesses function stores guesses
  # test number correct
  # test current card
  # test record_guess
  # test round.guesses.count
  # test round.guesses.last.feedback
  # test number correct
  # test percent correct
end

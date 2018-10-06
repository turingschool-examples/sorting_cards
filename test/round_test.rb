require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/guess'
require './lib/round'
require 'pry'

class RoundTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    cards = [card_1, card_2]
    deck = Deck.new(cards)
    round = Round.new(deck)
    assert_instance_of Round, round
  end

  def test_it_is_initialized_with_a_deck
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    cards = [card_1, card_2]
    deck = Deck.new(cards)
    round = Round.new(deck)
    assert round.deck
  end

  def test_you_can_check_guesses_on_a_round
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    cards = [card_1, card_2]
    deck = Deck.new(cards)
    round = Round.new(deck)
    assert [], round.guesses
  end

  def test_first_card_is_current_card
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    cards = [card_1, card_2]
    deck = Deck.new(cards)
    round = Round.new(deck)
    assert_equal cards[0], round.current_card
  end

  def test_that_new_guess_can_be_recorded
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    cards = [card_1, card_2]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts" })
    assert_equal "3 of Hearts", round.guesses.last.response
  end

  def test_that_guess_card_is_class_guess
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    cards = [card_1, card_2]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts" })
    assert_equal Guess, new_guess.class
  end

  def test_that_correct_guess_is_in_fact_correct
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    cards = [card_1, card_2]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts" })
    assert new_guess.correct?
  end

  def test_that_after_guess_current_card_changes
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    cards = [card_1, card_2]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts" })
    new_card = deck.cards.rotate[0]
    assert_equal deck.top_card, new_card
  end

  def test_that_amount_of_guesses_is_recorded_properly
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    cards = [card_1, card_2]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_guess_1 = round.record_guess({value: "3", suit: "Hearts" })
    new_guess_2 = round.record_guess({value: "Jack", suit: "Diamonds" })
    assert_equal 2, round.guesses.count
  end

  def test_that_correct_guesses_are_recorded
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    cards = [card_1, card_2]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_guess_1 = round.record_guess({value: "3", suit: "Hearts" })
    new_guess_2 = round.record_guess({value: "Jack", suit: "Diamonds" })
    assert_equal 1, round.number_correct
  end

  def test_percentage_of_correct_guesses
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    cards = [card_1, card_2]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_guess_1 = round.record_guess({value: "3", suit: "Hearts" })
    new_guess_2 = round.record_guess({value: "Jack", suit: "Diamonds" })
    assert_equal 50.0, round.percent_correct
    binding.pry
  end
end

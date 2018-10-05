require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/guess'
require './lib/round'
require 'pry'

class RoundTest < Minitest::Test

  # def setup
  #   @card_1 = Card.new("5", "Spades")
  #   @card_2 = Card.new("7", "Clubs")
  #   @deck = Deck.new([@card_1, @card_2])
  #   @round = Round.new(@deck)
  #   # binding.pry
  # end

  def test_it_exists
    cards = Card.new("5", "Spades"), Card.new("7", "Clubs")
    deck = Deck.new(cards)
    round = Round.new(deck)
    assert_instance_of Round, round
  end

  def test_it_is_initialized_with_a_deck
    cards = Card.new("5", "Spades"), Card.new("7", "Clubs")
    deck = Deck.new(cards)
    round = Round.new(deck)
    assert round.deck
  end

  def test_you_can_check_guesses_on_a_round
    cards = Card.new("5", "Spades"), Card.new("7", "Clubs")
    deck = Deck.new(cards)
    round = Round.new(deck)
    assert [], round.guesses
  end

  def test_first_card_is_current_card
    cards = Card.new("5", "Spades"), Card.new("7", "Clubs")
    deck = Deck.new(cards)
    round = Round.new(deck)
    # binding.pry
    assert_equal cards[0], round.current_card
    # binding.pry
  end

  def test_instance_of_guess
    cards = Card.new("5", "Spades"), Card.new("7", "Clubs")
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_guess = Guess.new("5 of Spades", round.current_card)
    assert_instance_of Guess, new_guess
  end

  def test_that_new_guess_can_be_recorded
    cards = Card.new("5", "Spades"), Card.new("7", "Clubs")
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_guess = round.record_guess({value: "5", suit: "Spades" })
    assert_instance_of Guess, new_guess
    assert_equal "5 of Spades", round.guesses.last.response
  end

  def test_that_guess_card_is_class_guess
    cards = Card.new("5", "Spades"), Card.new("7", "Clubs")
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_guess = round.record_guess({value: "5", suit: "Spades" })
    assert_equal Guess, new_guess.class
  end

  def test_that_correct_guess_is_correct
    cards = Card.new("5", "Spades"), Card.new("7", "Clubs")
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_guess = round.record_guess({value: "5", suit: "Spades" })
    assert new_guess.correct?
  end

  def test_that_correct_guesses_are_counted
    cards = Card.new("5", "Spades"), Card.new("7", "Clubs")
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_guess = round.record_guess({value: "5", suit: "Spades" })
    assert_equal round.guesses.count, round.number_correct
    binding.pry
  end








end

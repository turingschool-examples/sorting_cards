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

  def test_when_guess_method_is_called_current_card_changes
    skip
  end

  def test_that_guess_card_is_recorded
    skip
  end

  def test_that_guess_card_is_class_guess
    skip
  end









end

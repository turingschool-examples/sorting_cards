require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/deck'
require './lib/round'
require 'pry'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("Ace", "Clubs")
    @card_2 = Card.new("8", "Spades")
    @card_3 = Card.new("Queen", "Hearts")
    @deck = Deck.new(@card_1, @card_2, @card_3)
    @round = Round.new(@deck)
    @correct_guess = Guess.new("8 of Spades", @card_1)
    @correct_guess_2 = Guess.new("Queen of Hearts", @card_3)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_has_a_deck
    assert_equal @deck, @round.deck
  end

  def test_it_has_current_card_and_is_first_in_deck
    assert_equal @deck.cards.first, @round.current_card
  end

  def test_it_has_guesses_and_is_empty_before_guessing
    assert_empty @round.guesses
  end

  def test_it_creates_and_returns_a_guess
    assert diff @correct_guess,
    @round.record_guess({value: 8, suit: "Spades"})
  end

  def test_it_adds_to_guesses_when_guess_is_created
    @round.record_guess({value: 8, suit: "Spades"})
    assert diff [@correct_guess], @round.guesses
  end

  def test_it_adds_multiple_guesses_when_multiple_are_created
    @round.record_guess({value: 8, suit: "Spades"})
    @round.record_guess({value: "Queen", suit: "Hearts"})
    assert diff [@correct_guess, @correct_guess_2], @round.guesses
  end

  def test_it_updates_current_card_when_guess_is_created
    assert_equal @card_1, @round.current_card
    @round.record_guess({value: 8, suit: "Spades"})
    assert_equal @card_2, @round.current_card
  end

  def test_it_knowns_how_many_guesses_are_correct
    @round.record_guess({value: "Ace", suit: "Clubs"})
    @round.record_guess({value: 8, suit: "Spades"})
    @round.record_guess({value: "Queen", suit: "Hearts"})

    assert_equal 3, @round.number_correct
  end

  def test_it_knowns_how_many_guesses_are_correct_with_a_false_guess
    @round.record_guess({value: "Ace", suit: "Clubs"})
    @round.record_guess({value: 8, suit: "Spades"})
    @round.record_guess({value: "Queen", suit: "Spades"})

    assert_equal 2, @round.number_correct
  end

  def test_it_knowns_how_many_guesses_are_correct_by_percentage
    @round.record_guess({value: "Ace", suit: "Clubs"})
    @round.record_guess({value: 8, suit: "Spades"})
    @round.record_guess({value: "Queen", suit: "Hearts"})

    assert_equal 100.0, @round.percent_correct
  end

  def test_it_knowns_how_many_guesses_are_correct_by_percentage_one_correct
    @round.record_guess({value: 10, suit: "Clubs"})
    @round.record_guess({value: 8, suit: "Clubs"})
    @round.record_guess({value: "Queen", suit: "Hearts"})

    assert_equal 33.3, @round.percent_correct
  end
end

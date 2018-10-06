require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/guess'
require './lib/round'
require 'pry'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("3", "Hearts")
    @card_2 = Card.new("4", "Clubs")
    @deck = Deck.new([@card_1, @card_2])
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_holds_a_deck
    assert_equal @deck, @round.deck
  end

  def test_it_holds_initialized_guesses
    assert_equal [], @round.guesses
  end

  def test_it_returns_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_it_records_guess
    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal Guess, new_guess.class
    assert_equal new_guess, @round.guesses[0]
  end

  def test_it_evaluates_correct_guesses
    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 1, @round.number_correct
  end

  def test_it_returns_current_card_after_record_guess
    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal @card_2, @round.current_card
  end

  def test_it_records_multiple_guesses
    @round.record_guess({value: "3", suit: "Hearts"})
    @round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 2, @round.guesses.count
  end

  def test_it_provides_proper_feedback_for_items_in_round
    @round.record_guess({value: "3", suit: "Hearts"})
    @round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal "Incorrect.", @round.guesses.last.feedback
  end

  def test_it_provides_proper_round_results
    @round.record_guess({value: "3", suit: "Hearts"})
    @round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 1, @round.number_correct
    assert_equal 50.0, @round.percent_correct
  end

end #RoundTest Class

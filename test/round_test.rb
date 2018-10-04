# round_test.rb
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("3","Hearts")
    @card_2 = Card.new("4", "Clubs")
    @deck = Deck.new([@card_1, @card_2])
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_contains_empty_guesses
    assert_equal [], @round.guesses
  end

  def test_it_has_a_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_it_can_record_a_new_guess_of_class_guess
    assert_instance_of Guess, @round.record_guess({value: "3", suit: "Hearts"})
  end

  def test_recorded_guess_card_has_correct_suit
    guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal "Hearts", guess.card.suit
  end

  def test_recorded_guess_card_has_correct_value
    guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal "3", guess.card.value
  end

  def test_recorded_guess_has_correct_response
    guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal "3 of Hearts", guess.response
  end

  def test_if_recorded_guess_can_confirm_correct
    guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal true, guess.correct?
  end

  def test_if_guess_is_saved
    guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal [guess], @round.guesses
  end

  def test_number_correct_guesses_is_recorded
    guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 1, @round.number_correct
  end

  def test_current_card_moves_to_next_card_after_guess
    guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal @card_2, @round.current_card
  end

  def test_if_incorrect_guess_is_saved
    @round.record_guess({value: "3", suit: "Hearts"})
    @round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 2, @round.guesses.count
  end

  def test_can_retrieve_feedback_from_new_guess
    @round.record_guess({value: "3", suit: "Hearts"})
    @round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal "Incorrect.", @round.guesses.last.feedback
  end

  def test_number_correct_guesses_is_recorded_after_incorrect_guess
    @round.record_guess({value: "3", suit: "Hearts"})
    @round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 1, @round.number_correct
  end

  def test_percent_correct_guesses_is_recorded
    @round.record_guess({value: "3", suit: "Hearts"})
    @round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 50.0, @round.percent_correct
  end

end

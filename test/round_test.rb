require_relative 'test_helper'
require_relative '../lib/guess'
require_relative '../lib/card'
require_relative '../lib/round'
require_relative '../lib/deck'



class TestRound < Minitest::Test
  def setup
    @deck = Deck.new [Card.new("3","Hearts"), Card.new("4", "Clubs")]
    @round = Round.new(@deck)
  end

  def help_setup_2_guesses

    @round.record_guess({value: "3", suit: "Hearts"})
    @round.record_guess({value: "Jack", suit: "Diamonds"})

  end

  def help_setup_3_guesses

    @round.record_guess({value: "3", suit: "Hearts"})
    @round.record_guess({value: "Jack", suit: "Diamonds"})
    @round.record_guess({value: "Queen", suit: "Spades"})

  end

  def test_it_has_guesses_array

    assert_equal @round.guesses, []

  end

  def test_current_card_gives_first_card_initially

    assert_equal @round.current_card.suit, "Hearts"
    assert_equal @round.current_card.value, "3"

  end

  def test_record_guess_holds_guess

    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert_instance_of Guess, new_guess

  end

  def test_recorded_guess_correct

    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert new_guess.correct?
  end

  def test_recorded_guess_included_in_guesses

    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert_includes @round.guesses, new_guess

  end

  def test_number_correct

    @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 1, @round.number_correct

  end

  def test_current_card

    @round.record_guess({value: "3", suit: "Hearts"})
    new_current_card = @round.current_card
    assert_equal "4", new_current_card.value
    assert_equal "Clubs", new_current_card.suit

  end

  def test_2nd_guess_count

    help_setup_2_guesses
    assert_equal 2, @round.guesses.count

  end

  def test_2nd_guess_count

    help_setup_2_guesses
    assert_equal 2, @round.guesses.count

  end

  def test_feedback_returns_incorrect

    @round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal "Incorrect.", @round.guesses.last.feedback

  end

  def test_number_correct

    help_setup_2_guesses
    assert_equal 1, @round.number_correct

  end

  def test_percent_correct

    help_setup_2_guesses
    assert_equal 50.0, @round.percent_correct
    help_setup_3_guesses
    assert_equal 50.0, @round.percent_correct

  end

  #


end

require_relative 'test_helper'

class TestRound < Minitest::Test
  def setup
    @deck = Deck.new [Card.new("3","Hearts"), Card.new("4", "Clubs")]
    @round = Round.new(@deck)
  end

  def test_it_has_guesses_array

    assert_equal @round.guesses, []

  end

  def test_current_card_gives_first_card_initially

    assert_equal @round.current_card.suit, "Hearts"
    assert_equal @round.current_card.value, "3"

  end

  def test_record_guess

    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert_instance_of Guess, new_guess
    assert new_guess.correct?
    assert_includes @round.guesses, new_guess
    assert_equal 1, @round.number_correct
    new_current_card = @round.current_card
    assert_equal "4", new_current_card.value
    assert_equal "Clubs", new_current_card.suit
    @round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 2, @round.guesses.count
    assert_equal "Incorrect.", @round.guesses.last.feedback
    assert_equal 1, @round.number_correct
    assert_equal 50.0, @round.percent_correct

  end




end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'


class GuessTest < Minitest::Test
  def setup
    @card = Card.new("Queen", "Hearts")
    @guess = Guess.new("Queen of Hearts", @card)
  end

  def test_it_exists
    assert_instance_of Guess, @guess
  end

  def test_it_has_a_instantiated_card
    assert_equal @card, @guess.card
  end
  
  def test_it_has_a_response
    assert_equal "Queen of Hearts", @guess.response
  end

  def test_it_returns_true_if_guess_matches
    assert_equal true, @guess.correct?
  end
  
  def test_it_returns_false_if_guess_matches
    guess2 = Guess.new("Ace of Spades", @card)

    assert_equal false, guess2.correct?
  end
  
  def test_it_returns_expected_feedback_when_correct
    assert_equal "Correct!", @guess.feedback
  end

  def test_it_returns_expected_feedback_when_incorrect
    guess2 = Guess.new("Ace of Spades", @card)

    assert_equal "Incorrect.", guess2.feedback
  end
end
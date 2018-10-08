require './lib/guess'
require './lib/card'
require 'minitest/autorun'
require 'minitest/pride'

class GuessTest < Minitest::Test

  def setup
    @card = Card.new("10", "Hearts")
    @guess= Guess.new("10 of Hearts", @card)
  end

  def test_guess_exists
    assert_instance_of Guess, @guess
  end

  def test_does_it_get_a_card
    assert_equal @card, @guess.card
  end

  def test_it_gets_response
    assert_equal @guess.guess, @guess.response
  end

  def test_if_response_is_correct
    assert_equal true, @guess.correct?
  end

  def test_if_gives_feedback
    assert_equal "Correct!", @guess.feedback
  end

  def test_if_guess_is_wrong
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)

    assert_equal false, guess.correct?
  end

  def test_for_feedback_incorrect
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)

    assert_equal "Incorrect!", guess.feedback
  end
end

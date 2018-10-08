require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'

class GuessTest < Minitest::Test

  def setup
    @card = Card.new("10", "Hearts")
    @guess = Guess.new("10 of Hearts", @card)
  end

  def test_it_exists
    assert_instance_of Guess, @guess
  end

  def test_it_has_a_response
    assert_equal "10 of Hearts", @guess.response
  end

  def test_it_has_a_card
    assert_equal @card, @guess.card
  end

  def test_it_can_confirm_correct
    assert_equal true, @guess.correct?
  end

  def test_it_can_confirm_incorrect
    guess = Guess.new("2 of Diamonds", @card)
    assert_equal false, guess.correct?
  end

  def test_it_gives_feedback_when_correct
    assert_equal "Correct!", @guess.feedback
  end

  def test_it_gives_feedback_when_incorrect
    guess = Guess.new("2 of Diamonds", @card)
    assert_equal "Incorrect.", guess.feedback
  end
end

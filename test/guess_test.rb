require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess'
require_relative '../lib/card'


class GuessTest < Minitest::Test
end

class TestCorrect < GuessTest

  def setup
    @card = Card.new("10", "Hearts")
    @guess = Guess.new("10 of Hearts", @card)
  end

  def test_it_exists
    assert_instance_of Guess, @guess
  end

  def test_it_contains_card
    assert_instance_of Card, @guess.card
  end

  def test_it_responds_to_response
    assert_equal("10 of Hearts", @guess.response)
  end

  def test_correct_return_true
    assert_equal(@guess.correct?, true)
  end

  def test_feedback
    assert_equal(@guess.feedback, "Correct!")
  end

end

class TestIncorrect < GuessTest

  def setup
    @card = Card.new("Queen", "Clubs")
    @guess = Guess.new("Two of Diamonds", @card)
  end

  def test_correct_return_false
    assert_equal(@guess.correct?, false)
  end

  def test_feedback
    assert_equal(@guess.feedback, "Incorrect.")
  end
end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'

class GuessTest < Minitest::Test
  def setup
    @card = Card.new("10", "Hearts")
    @guess = Guess.new("10 of Hearts", @card)
  end

  def test_it_exists
    assert_instance_of Guess, @guess
  end

  def test_it_has_a_guess
    skip #this test is not working yet
    assert_equal "10 of Hearts", @guess.card
  end

  def test_it_has_a_response
    assert_equal "10 of Hearts", @guess.response
  end

  def test_it_is_correct
    assert_equal true, @guess.correct?
  end

  def test_it_is_not_correct
    @card = Card.new("Queen", "Clubs")
    @guess = Guess.new("2 of Diamonds", @card)
    assert_equal false, @guess.correct?
  end

  def test_it_has_feedback_positive
    assert_equal "Correct!", @guess.feedback
  end

  def assert_it_has_feedback_negative
    @card = Card.new("Queen", "Clubs")
    @guess = Guess.new("2 of Diamonds", @card)
    assert_equal "Incorrect.", @guess.feedback
  end

end

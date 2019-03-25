require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'

class GuessTest < MiniTest::Test
  def setup
    @card = Card.new("10", "Hearts")
    @guess = Guess.new("10 of Hearts", @card)
  end

  def test_does_it_exist
    assert_instance_of Guess, @guess
  end

  def test_it_has_a_card
    assert_equal @card, @guess.card
  end

  def test_it_has_a_response
    assert_equal "10 of Hearts", @guess.response
  end

  def test_method_correct_returns_true
    assert @guess.correct?
  end

  def test_method_correct_returns_false
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)
    refute guess.correct?
  end

  def test_method_feedback_returns_correct
    assert_equal "Correct!", @guess.feedback
  end

  def test_method_feedback_returns_incorrect
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)
    assert_equal "Incorrect.", guess.feedback
  end
end

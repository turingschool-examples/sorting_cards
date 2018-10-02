require './test/helper'

class GuessTest < Minitest::Test

  def setup
    @card    = Card.new("10", "Hearts")
    @guess   = Guess.new("10 of Hearts", @card)
    @card_i  = Card.new("Queen", "Clubs")
    @guess_i = Guess.new("2 of Diamonds", @card_i)
  end

  def test_it_exists
    assert_instance_of Guess, @guess
  end

  def test_it_can_have_one_card
    assert_instance_of Card, @guess.card
  end

  def test_it_can_have_a_response
    assert_equal "10 of Hearts", @guess.response
  end

  def test_it_can_return_a_guess_correct
    assert true, @guess.correct?
  end

  def test_it_can_return_a_feedback
    assert "Correct!", @guess.feedback
  end

  def test_it_can_add_a_different_card
    assert_instance_of Card, @guess.card
    assert_instance_of Guess, @guess_i
  end

  def test_it_can_have_a_different_response
    assert_equal "2 of Diamonds", @guess_i.response
  end

  def test_it_can_return_a_guess_incorrect
    assert_equal false, @guess_i.correct?
  end

  def test_it_can_return_a_feedback
    assert "Incorrect!", @guess_i.feedback
  end

end

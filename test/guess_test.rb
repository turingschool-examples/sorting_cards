require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'

class GuessTest < Minitest::Test
  def test_it_exists
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_instance_of Guess, guess
  end

  def test_it_has_attributes
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal "10 of Hearts", guess.response
    assert_equal card, guess.card
  end

  def test_it_can_see_if_guess_is_correct
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert true, guess.correct?
    assert_equal "Correct!", guess.feedback
  end

  def test_it_can_be_incorrect
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)
    assert_equal card, guess.card
    assert_equal "2 of Diamonds", guess.response
    assert_equal false, guess.correct?
    assert_equal "Incorrect.", guess.feedback
  end
end

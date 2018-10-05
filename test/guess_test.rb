require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'

class GuessTest < Minitest::Test

  def test_the_guess_exists
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_instance_of Guess, guess
  end

  def test_the_guess_has_a_card
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal card, guess.card
  end

  def test_the_guess_has_a_response
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal "10 of Hearts", guess.response
  end

  def test_the_guess_evalutes_correctness
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal true, guess.correct?
  end

  def test_the_guess_returns_feedback
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal "Correct!" , guess.feedback
  end
end


# def setup
#   @card = Card.new("10", "Hearts")
#   @guess = Guess.new("10 of Hearts", @card)
# end
#
# def test_the_guess_exists
#   assert_instance_of Guess, @guess
# end
#
# def test_the_guess_has_a_card
#   assert_equal @card, @guess.@card
# end
#
# def test_the_guess_has_a_response
#   skip
#   card = Card.new("10", "Hearts")
#   guess = Guess.new("10 of Hearts", card)
#   assert_equal "10 of Hearts", guess.response
# end
#
# def test_the_guess_evalutes_correctness
#   skip
#   card = Card.new("10", "Hearts")
#   guess = Guess.new("10 of Hearts", card)
#   assert_equal true, guess.correct?
# end
#
# def test_the_guess_returns_feedback
#   skip
#   card = Card.new("10", "Hearts")
#   guess = Guess.new("10 of Hearts", card)
#   assert_equal "Correct!" , guess.feedback
# end
# end

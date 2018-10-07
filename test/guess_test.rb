require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'

class GuessTest < Minitest::Test
  def test_it_exists

    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_instance_of Guess, guess
  end
  
  def test_it_has_a_card

    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal card, guess.card
  end

  def test_it_has_a_wrong_card
    card = Card.new("Q", "Clubs")
    guess = Guess.new("10 of Hearts", card)
    assert_equal card, guess.card
  end

  def test_it_has_a_response
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal "10 of Hearts", guess.response
  end

  def test_it_has_a_false_response
    card = Card.new("10", "Hearts")
    guess = Guess.new("2 of Diamonds", card)
    refute_equal "10 of Hearts", guess.response
  end

  def test_that_it_is_correct?
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal true, guess.correct?
  end

  def test_that_it_is_incorrect?
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    refute_equal false, guess.correct?
  end

  def test_the_feedback_is_correct
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal "Correct!", guess.feedback
  end

  def test_the_feedback_is_incorrect
    card = Card.new("10", "Hearts")
    guess = Guess.new("2 of Spades", card)
    assert_equal "Incorrect.", guess.feedback
  end
end

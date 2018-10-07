require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'

class GuessTest < Minitest::Test
  # test for a new card instance
  def test_card_instance
    card = Card.new("10", "Hearts")

    assert_instance_of Card, card
  end

  # test for a new guess instance
  def test_for_guess_instance
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)


    assert_instance_of Guess, guess
  end

  # test guess.card returns suit + value
  def test_guess_card_return
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_equal guess.card, card
  end
  # test guess.response returns "10 of Hearts"
  def test_guess_response
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    #assert_equal guess.response, "#{@card.value} of #{@card.suit}"
  end
  # test guess.correct? returns true
  def test_guess_correct?
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_equal guess.correct?, true
  end
  # test guess.feedback returns "correct!" when Correct
  def test_guess_feedback_true
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_equal guess.feedback, "Correct!"
  end
  # test guess.feedback returns "Incorrect." when Incorrect

  def test_guess_feedback_false
    card = Card.new("10", "Hearts")
    guess = Guess.new("8 of Hearts", card)

    assert_equal guess.feedback, "Incorrect."
  end








end

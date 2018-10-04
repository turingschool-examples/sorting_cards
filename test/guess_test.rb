require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/guess'


class GuessTest < Minitest::Test

  def test_it_exists
    card = Card.new("5", "Spades")
    guess = Guess.new("5 of Spades", card)
    assert_instance_of Guess, guess
  end

  def test_correct_method_returns_true_if_correct
    card = Card.new("5", "Spades")
    guess = Guess.new("5 of Spades", card)
    assert guess.correct?
  end

  def test_correct_method_returns_false_if_incorrect
    card = Card.new("Jack", "Hearts")
    guess = Guess.new("5 of Spades", card)
    refute guess.correct?
  end

  def test_feedback_returns_you_win_if_correct
    card = Card.new("5", "Spades")
    guess = Guess.new("5 of Spades", card)
    assert "You win!", guess.feedback
  end

  def test_feedback_returns_youre_wrong_if_incorrect
    card = Card.new("Jack", "Hearts")
    guess = Guess.new("5 of Spades", card)
    assert "You're wrong.", guess.feedback
  end
end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'

class GuessTest < Minitest::Test
  def setup
    @card = Card.new("10", "Hearts")
    @correct_guess = Guess.new("10 of Hearts", @card)
    @false_guess = Guess.new("Queen of Spades", @card)
  end

  def test_it_has_a_guess
    assert_equal "10 of hearts", @correct_guess.guess
  end

  def test_it_has_a_card
    assert_equal @card, @correct_guess.card
  end

  def test_it_has_a_suit
    assert_equal "hearts", @correct_guess.suit
  end

  def test_it_has_a_value
    assert_equal "10", @correct_guess.value
  end

  def test_it_responds
    assert_equal "10 of hearts", @correct_guess.response
  end

  def test_it_evaluates_for_correct_guess
    assert @correct_guess.correct?
  end

  def test_it_gives_feedback_with_correct_guess
    assert_equal "Correct!", @correct_guess.feedback
  end

  def test_it_evaluates_for_wrong_guess
    refute @false_guess.correct?
  end

  def test_it_gives_feedback_with_wrong_guess
    assert_equal "Incorrect.", @false_guess.feedback
  end
end

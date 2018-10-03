require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/guess.rb'

class GuessTest < Minitest::Test
  def setup
    @card = Card.new("10", "Hearts")
    @guess_correct = Guess.new("10 of Hearts", @card)
    @guess_wrong = Guess.new("8 of Diamonds", @card)
  end

  def test_it_exists
    assert_instance_of Guess, @guess_correct
  end

  def test_it_has_response
    assert_equal "10 of Hearts", @guess_correct.response
  end

  def test_card_method_returns_card_object
    assert_equal @card, @guess_correct.card
  end

  def test_correct_guess_returns_true
    assert @guess_correct.correct?
  end

  def test_wrong_guess_returns_false
    refute @guess_wrong.correct?
  end

  def test_correct_guess_says_correct
    assert_equal "Correct!", @guess_correct.feedback
  end

  def test_wrong_guess_says_incorrect
    assert_equal "Incorrect.", @guess_wrong.feedback
  end

end

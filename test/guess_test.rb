require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require 'pry'

class GuessTest < Minitest::Test
  def setup
    @card = Card.new("10", "Hearts")
    @guess = Guess.new("10 of Hearts", @card)
  end

  def test_it_exists
    assert_instance_of Guess, @guess
  end

  def test_it_has_a_response
    assert_equal "10 of Hearts", @guess.response
  end

  def test_it_has_a_card
    assert_equal @card, @guess.card
  end

  def test_it_judges_correct_responses
    assert_equal true, @guess.correct?
  end

  def test_it_provides_correct_feedback
    assert_equal "Correct!", @guess.feedback
  end

  def test_incorrect_values_handled_properly
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)

    assert_equal card, guess.card
    assert_equal "2 of Diamonds", guess.response
    assert_equal false, guess.correct?
    assert_equal "Incorrect.", guess.feedback
  end
end

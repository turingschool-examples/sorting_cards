
require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'

class GuessTest < Minitest::Test

  def test_it_exist
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_instance_of Guess, guess
  end

  def test_it_has_a_card_and_guess
     card = Card.new("10", "Hearts")
     guess = Guess.new("10 of Hearts", card)

     assert_instance_of Card, guess.card
     assert_equal card, guess.card
  end


  def test_it_has_a_response
     card = Card.new("10", "Hearts")
     guess = Guess.new("10 of Hearts", card)

     assert guess.response
  end

  def test_correct_verifies_guess
     card = Card.new("10", "Hearts")
     guess = Guess.new("10 of Hearts", card)

     assert guess.correct?
  end


  def test_it_gives_feedback
     card = Card.new("10", "Hearts")
     guess = Guess.new("10 of Hearts", card)

     guess.correct?

     assert_equal "True!", guess.feedback
  end

  def test_it_can_have_a_different_card_and_guess
     card = Card.new("Queen", "Clubs")
     guess = Guess.new("2 of Diamonds", card)

     assert_instance_of Card, guess.card
     assert_equal card, guess.card
  end

  def test_it_has_a_response_for_alternate_cards
     card = Card.new("Queen", "Clubs")
     guess = Guess.new("2 of Diamonds", card)

    assert guess.response
  end

  def test_correct_verifies_guess_for_alternate_cards
      card = Card.new("Queen", "Clubs")
      guess = Guess.new("2 of Diamonds", card)

     assert_equal false, guess.correct?
  end


# guess.feedback
#  # "Incorrect."#

end

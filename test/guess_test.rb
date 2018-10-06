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
    assert_instance_of Card, guess.card
  end

  def test_the_guess_has_a_correct_response
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal "10 of Hearts", guess.response
  end

  def test_the_guess_evalutes_false_correctness
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal true, guess.correct?
  end

  def test_the_guess_returns_correct_feedback
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal "Correct!" , guess.feedback
  end


#
# pry(main)> card = Card.new("Queen", "Clubs")
# #=> #<Card:0x00007f99839aa2a8 @suit="Clubs", @value="Queen">
#
# pry(main)> guess = Guess.new("2 of Diamonds", card)
# #=> #<Guess:0x00007f998413ee60 @card=#<Card:0x00007f99839aa2a8 @suit="Clubs", @value="Queen">, @guess="2 of Diamonds">
#
# pry(main)> guess.card
# => #<Card:0x00007f99839aa2a8 @suit="Clubs", @value="Queen">
#  def test_the_guess_has_a_card
def test_the_guess_has_different_card
  card = Card.new("Queen", "Clubs")
  guess = Guess.new("2 of Diamonds", card)
  assert_instance_of Card, guess.card
end



# pry(main)> guess.response
# => "2 of Diamonds"
def test_the_guess_has_a_different_response
  card = Card.new("Queen", "Clubs")
  guess = Guess.new("2 of Diamonds", card)
  assert_equal "2 of Diamonds", guess.response
end

#
# pry(main)> guess.correct?
# => false
def test_the_guess_has_a_false_correctness
  card = Card.new("Queen", "Clubs")
  guess = Guess.new("2 of Diamonds", card)
  assert_equal false, guess.correct?
end
#
# pry(main)> guess.feedback
# => "Incorrect."
def test_the_guess_has_a_incorrect_feedback
  card = Card.new("Queen", "Clubs")
  guess = Guess.new("2 of Diamonds", card)
  assert_equal "Incorrect.", guess.feedback
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
#   assert_equal @card, @guess.card
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

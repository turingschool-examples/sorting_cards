
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

  def test_it_has_a_card
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

# card = Card.new("Queen", "Clubs")
# #=> #<Card:0x00007f99839aa2a8 @suit="Clubs", @value="Queen">
#
# guess = Guess.new("2 of Diamonds", card)
# #=> #<Guess:0x00007f998413ee60 @card=#<Card:0x00007f99839aa2a8 @suit="Clubs", @value="Queen">, @guess="2 of Diamonds">
#
# guess.card
#   #<Card:0x00007f99839aa2a8 @suit="Clubs", @value="Queen">
#
# guess.response
#  # "2 of Diamonds"
#
# guess.correct?
#  # false
#
# guess.feedback
#  # "Incorrect."#

end

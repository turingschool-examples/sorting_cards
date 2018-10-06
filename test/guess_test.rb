require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'
require 'pry'

#binding.pry#

class GuessTest < Minitest::Test

  #pry(main)> card = Card.new("10", "Hearts")
  #=> #<Card:0x00007f9984004cc0 @suit="Hearts", @value="10">
  def test_it_exists
    card = Card.new("10","Hearts")
    guess = Guess.new("Ace of Spades",card)
    assert_instance_of Guess, guess
  end

  #pry(main)> guess.card
#=> #<Card:0x00007f9984004cc0 @suit="Hearts", @value="10">
    def test_it_has_a_card
      card = Card.new("10","Hearts")
      guess = Guess.new("Ace of Spades", card)
      assert_instance_of Card, guess.card
      #assert_equal false, guess.string
    end
    #pry(main)> guess.response
    #=> "10 of Hearts"
      def test_it_has_a_response
        card = Card.new("10","Hearts")
        guess = Guess.new("10 of Hearts", card)
        assert_equal "10 of Hearts", guess.response
      end

    #pry(main)> guess.correct?
#=> true
  def test_guess_is_correct?
    card = Card.new("10","Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal true, guess.correct?
  end
#  pry(main)> guess.feedback
  #=> "Correct!"
  def test_returns_feedback
    card = Card.new("10","Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal "Correct!", guess.feedback
  end

  #pry(main)> card = Card.new("Queen", "Clubs")
  #=> #<Card:0x00007f99839aa2a8 @suit="Clubs", @value="Queen">
  def test_a_different_card
      card = Card.new("Queen","Clubs")
      guess = Guess.new("2 of Diamonds", card)
      assert_instance_of Card, guess.card
      #assert_equal false, guess.string
    end
    #pry(main)> guess.response
    #{}"2 of Diamonds"
    def test_it_has_a_different_response
      card = Card.new("Queen","Clubs")
      guess = Guess.new("2 of Diamonds", card)
      assert_equal "2 of Diamonds", guess.response
    end
    #pry(main)> guess.correct?
    #=> false
    def test_guess_is_incorrect?
      card = Card.new("Queen","Clubs")
      guess = Guess.new("2 of Diamonds", card)
      assert_equal false, guess.correct?
    end
    #pry(main)> guess.feedback
    # ="Incorrect."
    def test_returns_feedback
      card = Card.new("Queen","Clubs")
      guess = Guess.new("2 of Diamonds", card)
      assert_equal "Incorrect.", guess.feedback
    end
end

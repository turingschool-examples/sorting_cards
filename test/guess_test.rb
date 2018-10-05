#require 'minitest/autorun'
#require 'minitest/pride'
require './lib/guess'
require 'pry'
#=> true

#require_relative './lib/card'
#=> true

binding.pry

class GuessTest < Minitest::Test
  def test_it_exists

    guess = Guess.new("Ace of Spades",card)
    assert_instance_of Guess, card
  end

    def test_it_has_a_value
      skip
      guess = Guess.new("Ace of Spades", card)
      assert_equal "Ace", guess.string
    end

      def test_it_has_a_suit
        skip
        guess = Guess.new("10 of Hearts", card)
        assert_equal "Spades", guess.string
      end
    end

#card = Card.new("10", "Hearts")
#=> #<Card:0x00007f9984004cc0 @suit="Hearts", @value="10">
#test for attributes

#=> #<Guess:0x00007f99842f0998 @card=#<Card:0x00007f9984004cc0 @suit="Hearts", @value="10">, @guess="10 of Hearts">

p guess.card
#=> #<Card:0x00007f9984004cc0 @suit="Hearts", @value="10">

p guess.response
#=> "10 of Hearts"

p guess.correct?
#=> true

p guess.feedback
#=> "Correct!"

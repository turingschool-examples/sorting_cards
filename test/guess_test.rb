require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess'
require_relative '../lib/card'


class GuessTest < Minitest::Test
end

class TestCorrect < GuessTest

  def setup
    @card = Card.new("10", "Hearts")
    @guess = Guess.new("10 of Hearts", @card)
  end

  def test_it_exists
    assert_instance_of Guess, @guess
  end

  def test_it_contains_card
    assert_instance_of Card, @guess.card
  end

  def test_it_responds_to_response
    assert_equal("10 of Hearts", @guess.response)
  end


end

# #=> #<Card:0x00007f9984004cc0 @suit="Hearts", @value="10">
#
# pry(main)> guess = Guess.new("10 of Hearts", card)
# #=> #<Guess:0x00007f99842f0998 @card=#<Card:0x00007f9984004cc0 @suit="Hearts", @value="10">, @guess="10 of Hearts">
#
# pry(main)> guess.card
# #=> #<Card:0x00007f9984004cc0 @suit="Hearts", @value="10">
#
# pry(main)> guess.response
# #=> "10 of Hearts"
#
# pry(main)> guess.correct?
# #=> true
#
# pry(main)> guess.feedback
# #=> "Correct!"
# end

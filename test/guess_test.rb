require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess'
require_relative '../lib/card'


class GuessTest < Minitest::Test

  def setup
    @card = Card.new("10", "Hearts")
    @guess = Guess.new("10 of Hearts", @card)
  end

  def test_it_exists
    assert_instance_of Card, @card
  end

end

# pry(main)> card = Card.new("10", "Hearts")
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

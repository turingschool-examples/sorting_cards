require './test/helper'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("3","Hearts")
    @card_2 = Card.new("4", "Clubs")
    @deck = Deck.new([@card_1, @card_2])
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_returns_an_instance_of_deck
    assert_instance_of Deck, @round.deck
  end

  def test_it_guesses_returns_an_empty_array
    assert_instance_of Array, @round.guesses
    assert_equal [], @round.guesses
  end

  def test_it_can_get_current_card
    assert_instance_of Card, @round.current_card
    assert_equal @card_1, @round.current_card
  end
end



# pry(main)> new_guess = round.record_guess({value: "3", suit: "Hearts"})
# #=> #<Guess:0x00007f972a15c160 @card=#<Card:0x00007f972a227f18 @suit="Hearts", @value="3">, @response="3 of Hearts">
#
# pry(main)> new_guess.class
# #=> Guess
#
# pry(main)> new_guess.correct?
# #=> true
#
# pry(main)> round.guesses
# #=> [#<Guess:0x00007f972a15c160 @card=#<Card:0x00007f972a227f18 @suit="Hearts", @value="3">, @response="3 of Hearts">]
#
# pry(main)> round.number_correct
# #=> 1
#
# pry(main)> round.current_card
# #=> #<Card:0x00007f9729a87998 @suit="Clubs", @value="4">
#
# pry(main)> round.record_guess({value: "Jack", suit: "Diamonds"})
# #=> #<Guess:0x00007f972a215b38...>
#
# pry(main)> round.guesses.count
# #=> 2
#
# pry(main)> round.guesses.last.feedback
# #=> "Incorrect."
#
# pry(main)> round.number_correct
# #=> 1
#
# pry(main)> round.percent_correct
# #=> 50.0

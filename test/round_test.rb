require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'

class RoundTest < MiniTest::Test
  def setup
    @card_1 = Card.new("3", "Hearts")
    @card_2 = Card.new("4", "Clubs")
    @cards = [@card_1, @card_2]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end
  def test_does_it_exist
    assert_instance_of Round, @round
  end

  def test_it_has_a_deck
    assert_equal @deck, @round.deck
  end

  def test_it_has_guesses_that_starts_empty
    assert_equal [], @round.guesses
  end
end
__END__
pry(main)> round.current_card
#=> #<Card:0x00007f972a227f18 @suit="Hearts", @value="3">

pry(main)> new_guess = round.record_guess({value: "3", suit: "Hearts"})
#=> #<Guess:0x00007f972a15c160 @card=#<Card:0x00007f972a227f18 @suit="Hearts", @value="3">, @response="3 of Hearts">

pry(main)> new_guess.class
#=> Guess

pry(main)> new_guess.correct?
#=> true

pry(main)> round.guesses
#=> [#<Guess:0x00007f972a15c160 @card=#<Card:0x00007f972a227f18 @suit="Hearts", @value="3">, @response="3 of Hearts">]

pry(main)> round.number_correct
#=> 1

pry(main)> round.current_card
#=> #<Card:0x00007f9729a87998 @suit="Clubs", @value="4">

pry(main)> round.record_guess({value: "Jack", suit: "Diamonds"})
#=> #<Guess:0x00007f972a215b38...>

pry(main)> round.guesses.count
#=> 2

pry(main)> round.guesses.last.feedback
#=> "Incorrect."

pry(main)> round.number_correct
#=> 1

pry(main)> round.percent_correct
#=> 50.0
```

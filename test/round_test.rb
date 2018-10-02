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

  def test_it_can_make_a_new_guess_and_record_it
    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert_instance_of Guess, new_guess
    assert_equal "3 of Hearts", @round.guesses.last.response
    assert_equal [new_guess], @round.guesses
  end

  def test_it_can_guess_correctly
    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal true, new_guess.correct?
  end

  # def test_it_can_count_number_of_correct_guesses
  #   assert_equal 1, @round.number_correct
  # end

end



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

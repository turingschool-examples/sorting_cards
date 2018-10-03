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
    assert_equal @card_1, @round.current_card
    assert_instance_of Card, @round.current_card
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

  def test_it_can_count_number_of_correct_guesses
    @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 1, @round.number_correct
  end

  def test_it_can_count_number_of_incorrect_guesses
    @round.record_guess({ value: "3", suit: "Hearts"})
    @round.record_guess({value: "Jack", suit: "Diamonds"})

    assert_equal @card_1, @round.current_card
    assert_equal @card_2, @round.current_card
    assert_equal 2, @round.guesses.count
    assert_equal "Incorrect!", @round.guesses.last.feedback
  end

  def test_it_percent_correct
    @round.record_guess({value:"3", suit:"Hearts"})
    @round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 50.0, @round.percent_correct
  end

end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'

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

  def test_it_has_a_deck
    assert_equal @deck, @round.deck
  end

  def test_it_starts_with_no_guess
    assert_equal [], @round.guesses
  end

  def test_it_knows_the_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_it_can_record_test
    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert_instance_of Guess, new_guess
    actual = @round.guesses.last
    expected = new_guess
    assert_equal expected, actual
    assert_equal true, new_guess.correct?
    #test to make sure rotating the deck
  end

  def test_it_has_guesses
    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal [new_guess], @round.guesses
  end

  def test_it_records_the_number_of_correct_guesses
    assert_equal 0, @round.number_correct
    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 1 , @round.number_correct
  end

  def test_it_can_rotate
    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal @card_2, @round.current_card
  end

  def test_it_can_record_a_new_guess
    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    new_guess = @round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_instance_of Guess, new_guess
  end

  def test_it_can_count_the_number_of_guesses
    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    new_guess = @round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 2, @round.guesses.count
  end

  def test_it_can_give_feedback_for_the_last_guess
    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    new_guess = @round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal "Incorrect.", @round.guesses.last.feedback
  end

  def test_it_can_record_the_percent_correct
    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    new_guess = @round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 50.0, @round.percent_correct
  end
end

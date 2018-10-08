require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/round.rb'
require './lib/guess.rb'


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

  def test_round_has_deck_method

    assert_equal @deck, @round.deck
  end

  def test_it_has_guesses

    assert_equal [], @round.guesses
  end

  def test_it_has_current_card_method

    assert_equal @card_1, @round.current_card
  end

  def test_it_has_recorded_new_guess

    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert_instance_of Guess, new_guess
  end

  def test_it_records_number_correct

    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    new_guess.correct?
    assert_equal 1, @round.number_correct
  end

  def test_it_rotates_deck

    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal @card_2, @round.current_card
  end

  def test_it_counts_guesses

    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    @round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 2, @round.guesses.count
  end

  def test_it_can_get_last_guess_feedback

    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    @round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal "Incorrect.", @round.guesses.last.feedback
  end

  def test_it_can_calculate_percent_correct

    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    @round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 50.0, @round.percent_correct
  end

end

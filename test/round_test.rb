require './lib/round'
require './lib/guess'
require './lib/card'
require './lib/deck'
require 'Minitest/autorun'
require 'minitest/pride'
require 'pry'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("3", "Hearts")
    @card_2 = Card.new("4", "Clubs")
    @deck = Deck.new([@card_1, @card_2])
    @round = Round.new(@deck)

  end

  def test_it_exists
    round = Round.new(@deck)

    assert_instance_of Round, round
  end

  def test_if_it_round_contains_deck
    assert_equal @deck, @round.deck
  end

  def test_if_guesses_returns__empty_array
    rounds = Round.new(@Deck)

    assert_equal [], rounds.guesses
  end

  def test_if_it_gives_current_card
    assert_equal @deck.cards[0], @round.current_card
  end


  def test_if_new_guess_is_guess_class
    round = Round.new(@deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})
    assert_equal Guess, new_guess.class
  end

  def test_if_new_guess_collects_response
    new_guess = @round.record_guess({value: "3", suit: "Hearts"})

    assert_equal new_guess.response, "3 of Hearts"
  end
  def test_the_guess_was_correct
    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal new_guess.correct?, true
  end
  # def test_if_guesses_contiain_new_objects
  #   @round
  #
  # end


end

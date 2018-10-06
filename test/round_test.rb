require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/guess'
require './lib/round'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("3", "Hearts")
    @card_2 = Card.new("4", "Clubs")
    # @card_3 = Card.new("5", "Diamonds")
    @cards = [@card_1, @card_2]#, @card_3]
    @deck = Deck.new(@cards)
    @guess = Guess.new("3 of Hearts", @card_1)
  end

  def test_it_exists
    round = Round.new(@deck)

    assert_instance_of Round, round
  end

  def test_the_deck
    round = Round.new(@deck)

    assert_equal @deck, round.deck
  end

  def test_there_are_guesses
    round = Round.new(@deck)

    assert_equal round.recordguess, round.guesses
  end

  def test_current_card_works
    round = Round.new(@deck)

    assert_equal @card_1, round.current_card
  end

  def test_that_there_is_a_new_guess
    skip
    round = Round.new(@deck)
    guess = round.recordguess
    assert_instance_of Guess, guess
    assert_equal @card_1, guess.card
    assert_equal @card_1, guess.response
  end
end

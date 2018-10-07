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
    # @new_guess = round.recordguess
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

    assert_equal [], round.guesses
  end

  def test_current_card_works
    round = Round.new(@deck)

    assert_equal @card_1, round.current_card
  end

  def test_that_there_is_a_new_guess_and_that_it_is_correct
    # skip
    round = Round.new(@deck)
    guess1 = round.recordguess({value: "3", suit: "Hearts"})
    assert_instance_of Guess, guess1
    # require 'pry'; binding.pry
    assert_equal "3 of Hearts", guess1.response
    # require 'pry'; binding.pry
  end

  def test_the_guess_is_stored_in_the_array
    round = Round.new(@deck)
    guess1 = round.recordguess({value: "3", suit: "Hearts"})

    assert_equal [guess1], round.guesses

  end

  def test_the_new_guess_is_correct
    round = Round.new(@deck)
    guess1 = round.recordguess({value: "3", suit: "Hearts"})

    assert guess1.correct?
  end

  def test_how_many_guesses_are_correct
    round = Round.new(@deck)
    round.recordguess({value: "3", suit: "Hearts"})

    assert_equal 1, round.number_correct
  end


  def test_the_current_card_is_changing
    round = Round.new(@deck)

    assert_equal @card_1, round.current_card
    round.recordguess({value: "3", suit: "Hearts"})
    assert_equal @card_2, round.current_card
  end

  def test_there_is_a_guess2
    round = Round.new(@deck)
    guess2 = round.recordguess({value: "Jack", suit: "Diamonds"})
    assert_instance_of Guess, guess2
  end

  def test_the_number_of_guesses
    round = Round.new(@deck)
    round.recordguess({value: "3", suit: "Hearts"})
    round.recordguess({value: "Jack", suit: "Diamonds"})

    assert_equal 2, round.guesses.length
  end

  def test_the_last_feedback
    round = Round.new(@deck)
    guess2 = round.recordguess({value: "Jack", suit: "Diamonds"})


    assert_equal "Incorrect.", guess2.feedback
  end

  def test_the_number_of_correct_guesses
    round = Round.new(@deck)
    round.recordguess({value: "3", suit: "Hearts"})
    round.recordguess({value: "Jack", suit: "Diamonds"})

    assert_equal 1, round.number_correct
  end

  def test_the_percent_correct
    round = Round.new(@deck)
    round.recordguess({value: "3", suit: "Hearts"})
    round.recordguess({value: "Jack", suit: "Diamonds"})

    assert_equal 50.0, round.percent_correct
  end
end

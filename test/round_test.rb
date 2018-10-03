require './test/test_helper'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("3","Hearts")
    @card_2 = Card.new("4", "Clubs")
    @deck = Deck.new([@card_1, @card_2])
    @round = Round.new(@deck)
    @new_guess = @round.record_guess({value: "3", suit: "Hearts"})
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_has_a_deck
    assert_equal @deck, @round.deck 
  end

  def test_it_has_a_list_of_guesses
    assert_kind_of Array, @round.guesses
  end

  def test_it_records_and_makes_new_guess
    assert_instance_of Guess, @new_guess
  end

  def test_it_logs_guesses
    assert_equal 1, @round.guesses.count
  end

  def test_it_gives_guess_feedback
    assert_equal "Correct!", @round.guesses.last.feedback
  end

  def test_it_gives_number_of_correct_guesses
    assert_equal 1, @round.number_correct
  end

  def test_it_gives_percetage_of_correct_guesses
    assert_equal 100.0, @round.percent_correct
    
    @round.record_guess({value: "4", suit: "Hearts"})
    
    assert_equal 50.0, @round.percent_correct
  end
end

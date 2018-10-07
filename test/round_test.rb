require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/guess'

class RoundTest < Minitest::Test

  def test_it_exist
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    assert_instance_of Round, round
    assert_instance_of Deck, round.deck
  end

  def test_it_has_an_empty_array
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    assert_equal [], round.guesses
  end

  def test_it_has_a_current_card
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    assert round.current_card
  end

  def test_if_new_guess_is_of_the_class_guess
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})

    assert_equal Guess, new_guess.class

  end

  def test_it_test_correct_verifies_guess

    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})

    assert new_guess.correct?

  end

  def test_guesses_are_being_recorded

    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})

    assert_equal new_guess, round.guesses.last

  end

  def test_guesses_can_be_counted

    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})
    require 'pry'
    binding.pry
    assert_equal 1, new_guess.number_correct

  end
end


# round.number_correct
# #=> 1
# binding.pry


# round.current_card
# #=> #<Card:0x00007f9729a87998 @suit="Clubs", @value="4">
# binding.pry
# round.record_guess({value: "Jack", suit: "Diamonds"})
# #=> #<Guess:0x00007f972a215b38...>
# binding.pry
# round.guesses.count
# #=> 2
# binding.pry
# round.guesses.last.feedback
# #=> "Incorrect."
# binding.pry
# round.number_correct
# #=> 1
# binding.pry
# round.percent_correct
# #=> 50.0
# binding.pry

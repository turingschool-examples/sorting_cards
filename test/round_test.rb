# pry(main)> require './lib/card'
# #=> true
#
# pry(main)> require './lib/deck'
# #=> true
#
# pry(main)> require './lib/round'
# #=> true

require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'

require 'pry'

class RoundTest < Minitest::Test
  # pry(main)> card_1 = Card.new("3","Hearts")
  # #=> #<Card:0x00007f972a227f18 @suit="Hearts", @value="3">
  #
  # pry(main)> card_2 = Card.new("4", "Clubs")
  # #=> #<Card:0x00007f9729a87998 @suit="Clubs", @value="4">
  #
  # pry(main)> deck = Deck.new([card_1, card_2])
  # #=> #<Deck:0x00007f972a214288...>
  #
  def test_the_deck_exists
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    assert_instance_of Deck, deck
  end
  #
  # pry(main)> round = Round.new(deck)
  # #=> #<Round:0x00007f972a1c7960...>,
  def test_the_round_exists
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Round, round
  end
  #
  # pry(main)> round.deck
  # #=> #<Deck:0x00007f972a214288...>
  def test_the_deck_exits_in_the_round
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Deck, round.deck
  end
  #
  # pry(main)> round.guesses
  # #=> []
  def test_round_has_guesses
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal [], round.guesses
  end
  #
  # pry(main)> round.current_card
  # #=> #<Card:0x00007f972a227f18 @suit="Hearts", @value="3">
  def test_in_can_has_card_1
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1, round.current_card
  end
  #
  # pry(main)> new_guess = round.record_guess({value: "3", suit: "Hearts"})
  # #=> #<Guess:0x00007f972a15c160 @card=#<Card:0x00007f972a227f18 @suit="Hearts", @value="3">, @response="3 of Hearts">
  #
  # pry(main)> new_guess.class
  # #=> Guess
def test_new_guess_with_return_record
  card_1 = Card.new("3", "Hearts")
  card_2 = Card.new("4", "Clubs")
  deck = Deck.new([card_1, card_2])
  round = Round.new(deck)
  new_guess = round.record_guess({value: "3", suit: "Hearts"})
  assert_instance_of Guess, new_guess
end


  #
  # pry(main)> new_guess.correct?
  # #=> true
  def test_new_guess_is_true
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})
    assert_equal true, new_guess.correct?
  end
  #
  # pry(main)> round.guesses
  # #=> [#<Guess:0x00007f972a15c160 @card=#<Card:0x00007f972a227f18 @suit="Hearts", @value="3">, @response="3 of Hearts">]
  #
  def test_guesses_recorded
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})
    assert_equal round.guesses[0], new_guess
  end
  # pry(main)> round.number_correct
  # #=> 1
def test_number_correct_equals_1
  card_1 = Card.new("3", "Hearts")
  card_2 = Card.new("4", "Clubs")
  deck = Deck.new([card_1, card_2])
  round = Round.new(deck)
  new_guess = round.record_guess({value: "3", suit: "Hearts"})
  assert_equal 1, round.number_correct
end
#   pry(main)> round.current_card
# #=> #<Card:0x00007f9729a87998 @suit="Clubs", @value="4">
def test_in_can_has_card_2
  card_1 = Card.new("3", "Hearts")
  card_2 = Card.new("4", "Clubs")
  deck = Deck.new([card_1, card_2])
  round = Round.new(deck)
  new_guess = round.record_guess({value: "3", suit: "Hearts"})
  assert_equal card_2, round.current_card
end
#
# pry(main)> round.record_guess({value: "Jack", suit: "Diamonds"})
# #=> #<Guess:0x00007f972a215b38...>
def test_next_guess_exists
  card_1 = Card.new("3", "Hearts")
  card_2 = Card.new("4", "Clubs")
  deck = Deck.new([card_1, card_2])
  round = Round.new(deck)
  assert_instance_of Guess, round.record_guess({value: "Jack", suit: "Diamonds"})
end
#
# pry(main)> round.guesses.count
# #=> 2
def test_number_of_guesses_equals_2
  card_1 = Card.new("3", "Hearts")
  card_2 = Card.new("4", "Clubs")
  deck = Deck.new([card_1, card_2])
  round = Round.new(deck)
  new_guess_1 = round.record_guess({value: "3", suit: "Hearts"})
  new_guess_2 = round.record_guess({value: "Jack", suit: "Diamonds"})
  assert_equal 2, round.guesses.count
end
#
# pry(main)> round.guesses.last.feedback
# #=> "Incorrect."
def test_guess_feedback_is_incorrect
  card_1 = Card.new("3", "Hearts")
  card_2 = Card.new("4", "Clubs")
  deck = Deck.new([card_1, card_2])
  round = Round.new(deck)
  new_guess_2 = round.record_guess({value: "Jack", suit: "Diamonds"})
  assert_equal "Incorrect.", round.guesses.last.feedback
end

#
# pry(main)> round.number_correct
# #=> 1
def test_number_correct_still_equals_1
  card_1 = Card.new("3", "Hearts")
  card_2 = Card.new("4", "Clubs")
  deck = Deck.new([card_1, card_2])
  round = Round.new(deck)
  new_guess_1 = round.record_guess({value: "3", suit: "Hearts"})
  new_guess_2 = round.record_guess({value: "Jack", suit: "Diamonds"})
  assert_equal 1, round.number_correct
end

#
# pry(main)> round.percent_correct
# #=> 50.0
def test_number_correct_still_equals_1
  card_1 = Card.new("3", "Hearts")
  card_2 = Card.new("4", "Clubs")
  deck = Deck.new([card_1, card_2])
  round = Round.new(deck)
  new_guess_1 = round.record_guess({value: "3", suit: "Hearts"})
  new_guess_2 = round.record_guess({value: "Jack", suit: "Diamonds"})
  assert_equal 50.0, round.percent_correct
end

end

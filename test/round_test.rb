require 'pry'

require './lib/card'
#=> true

require './lib/deck'
#=> true

require './lib/round'
#=> true
# binding.pry
card_1 = Card.new("3","Hearts")
#=> #<Card:0x00007f972a227f18 @suit="Hearts", @value="3">
# binding.pry
card_2 = Card.new("4", "Clubs")
#=> #<Card:0x00007f9729a87998 @suit="Clubs", @value="4">
# binding.pry
deck = Deck.new([card_1, card_2])
#=> #<Deck:0x00007f972a214288...>
# binding.pry
round = Round.new(deck)
#=> #<Round:0x00007f972a1c7960...>,
# binding.pry
round.deck
#=> #<Deck:0x00007f972a214288...>
# binding.pry
round.guesses
#=> []
# binding.pry
round.current_card
#=> #<Card:0x00007f972a227f18 @suit="Hearts", @value="3">
# binding.pry

new_guess = round.record_guess({value: "3", suit: "Hearts"})
#=> #<Guess:0x00007f972a15c160 @card=#<Card:0x00007f972a227f18 @suit="Hearts", @value="3">, @response="3 of Hearts">
# binding.pry

new_guess.class
#=> Guess
binding.pry

new_guess.correct?
#=> true
binding.pry

round.guesses
#=> [#<Guess:0x00007f972a15c160 @card=#<Card:0x00007f972a227f18 @suit="Hearts", @value="3">, @response="3 of Hearts">]
binding.pry
round.number_correct
#=> 1
binding.pry
round.current_card
#=> #<Card:0x00007f9729a87998 @suit="Clubs", @value="4">
binding.pry
round.record_guess({value: "Jack", suit: "Diamonds"})
#=> #<Guess:0x00007f972a215b38...>
binding.pry
round.guesses.count
#=> 2
binding.pry
round.guesses.last.feedback
#=> "Incorrect."
binding.pry
round.number_correct
#=> 1
binding.pry
round.percent_correct
#=> 50.0
binding.pry

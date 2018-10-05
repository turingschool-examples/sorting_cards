require './lib/guess'

class Round
  attr_reader :deck,
              :next_card

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  #The idea is that when we start a Round,
  #the current card is the first in the deck
  #(the first in the Deck’s array of Cards).
  def current_card
    @deck.cards.first
  end

  def add_card
    current_card += 1
  end
  
  #When we make a guess, the guess is recorded,
  def guesses
    @guesses
  end

  #and the current card becomes the next card in
  #the deck.
  #The record_guess method is the crux of this
  #problem. The record_guess method takes a hash
  #representing the guess.
  def record_guess(hash)
    value = hash[:value]
    suit = hash[:suit]
    response = "#{value} of #{suit}"
    @guesses << Guess.new(response, current_card)
    @guesses.last
  end

#It should create a new
#Guess object with the appropriate response and
#Card. It should store this new guess, as well
#as return it from the record_guess method. Also,
#when the record_guess method is called, the Round
#should move on to the next card in the deck.
end

require_relative '../lib/fun_guessing_game'
require_relative 'test_helper'

class FunGuessingGameTest < MiniTest::Test

  #helper_methods
  def help_setup_small_deck1
    card1 = Card.new("Ace","Hearts")
    card2 = Card.new("Ace","Spades")
    card3 = Card.new("3","Clubs")
    @small_deck1 = Deck.new(card1, card2, card3)
  end


  #testing evaluation methods
  #Starting with suit eval tests
  


end

require './lib/round'
require './lib/guess'

require './lib/deck'
require 'pry'



class Card

attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
    @new_card_value = {"2" => 20, "3" => 30, "4" => 40, "5" => 50,"6" => 60,"7" => 70, "8" => 80,
                    "9" => 90, "10" => 100, "Jack" => 110, "Queen" => 120, "King" => 130, "Ace" => 140}
    @new_suit_value = {"Clubs" => 1, "Diamonds" => 2, "Hearts" => 3, "Spades" => 4}
  end

  def assign_value
    @new_card_value[value]  + @new_suit_value[suit]
     # new_value = @new_card_value[value]  + @new_suit_value[suit]
  end




end

require 'pry'

class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.size
  end

  def sort
    cards_values = value_cards

    sorted_cards = []
    @cards.each do |card|
      #Iterate through deck (array of cards), comparing first and second.
      # If the first is bigger, swap spots with second. If second is bigger,
      # compare second and third.
    end



  end



end

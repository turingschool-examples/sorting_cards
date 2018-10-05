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

  def value_cards
    values_sort_order = {"2" => 0, "3" => 1, "4" => 2, "5" => 3, "6" => 4,
                          "7" => 5, "8" => 6, "9" => 7, "10" => 8, "Jack" => 9,
                          "Queen" => 10, "King" => 11, "Ace" => 12}
    suits_sort_order = {"Clubs" => 0, "Diamonds" => 1,
                        "Hearts" => 2, "Spades" => 3}

    cards_values = {}
    cards.each do |card|
      cards_values[card] = [values_sort_order[card.value],
                            suits_sort_order[card.suit]]
    end

    return cards_values
  end

end

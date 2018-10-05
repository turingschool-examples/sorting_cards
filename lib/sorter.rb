# sorter.rb

class Sorter

  def initialize(deck)
    @deck = deck
  end

  def value_deck
    values_sort_order = {"2" => 0, "3" => 1, "4" => 2, "5" => 3, "6" => 4,
                        "7" => 5, "8" => 6, "9" => 7, "10" => 8, "Jack" => 9,
                        "Queen" => 10, "King" => 11, "Ace" => 12}
    suits_sort_order = {"Clubs" => 0, "Diamonds" => 1,
                        "Hearts" => 2, "Spades" => 3}

    cards_values = {}
    @deck.cards.each do |card|
      cards_values[card] = [values_sort_order[card.value],
                            suits_sort_order[card.suit]]
    end

    return cards_values
  end

  

end

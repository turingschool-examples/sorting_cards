
class Sorter
  attr_reader :starting_cards

  def initialize(deck)
    @starting_cards = deck.cards
  end

### GENERAL HELPER METHODS ###

  def create_working_array #helper method
    sort_values = map_sort_values
    working_cards = []
    index = 0
    @starting_cards.count.times do
      working_cards[index] = { :card       => @starting_cards[index],
                               :sort_value => sort_values[index] }
      index += 1
    end
    return working_cards
  end #create_working_array
  def map_sort_values #helper method
    value_factor = {"2" => 2, "3" => 3, "4" => 4, "5" => 5,
                  "6" => 6, "7" => 7, "8" => 8, "9" => 9,
                  "10" => 10, "Jack" => 11, "Queen" => 12,
                  "King" => 13, "Ace" => 14
                  }
    suit_factor = {"Clubs" => 0.0, "Diamonds" => 0.1,
                  "Hearts" => 0.2, "Spades" => 0.3
                  }
    @starting_cards.map do |card|
      value_factor[card.value] + suit_factor[card.suit]
    end
  end #map_sort_values

### MY OWN SORT & ITS HELPERS ###

  def sort
    working_cards = create_working_array
    sorted_cards = []
    working_cards.count.times do
      low_index = index_lowest_remaining(working_cards)
      #Put the lowest remaining card into the sorted_cards array
      sorted_cards << working_cards[low_index][:card]
      #Put nil in the sort value to signify that the card has been placed
      working_cards[low_index][:sort_value] = nil
    end
    return sorted_cards
  end
  def index_lowest_remaining(working_cards) #Helper method for sort
    current_low_value = 100 #init with a higher-than-possible value
    current_low_index = 0
    index = 0
    working_cards.count.times do
      current_sort_value = working_cards[index][:sort_value]
      if current_sort_value != nil && current_sort_value < current_low_value
      #current_sort_value of nil signifies that the card has been placed
        current_low_value = current_sort_value
        current_low_index = index
      end
      index += 1
    end
    return current_low_index
  end #sort and its helpers

### MERGESORT & ITS HELPERS ###

  def mergesort
    working_cards = create_working_array
    sorted_cards = branch_n_merge(working_cards)
    sorted_cards.map { |card_record| card_record[:card] }
  end
  def branch_n_merge(working_cards)
    return working_cards if working_cards.length == 1
    middle_index = working_cards.length / 2
    left_array = branch_n_merge(working_cards[0...middle_index])
    right_array = branch_n_merge(working_cards[middle_index..-1])
    merge(left_array, right_array)
  end
  def merge(left_array, right_array)
    low_value_array = []
    until left_array.length == 0 || right_array.length == 0 do
      if left_array.first[:sort_value] <= right_array.first[:sort_value]
        low_value_array << left_array.shift
      else
        low_value_array << right_array.shift
      end
    end #until
    low_value_array + left_array + right_array
  end

end #Sorter

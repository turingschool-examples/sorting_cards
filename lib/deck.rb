require 'pry'
require 'pp'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def sort_setup
    @cards.map do |card|
      [card.overall_value, card]
    end
  end

  def sort(sort_method = "bubble sort")
    case sort_method
    when "bubble sort"
      sorted_oa_values = bubble_sort(sort_setup)
    when "merge sort"
      sorted_oa_values = merge_sort(sort_setup)
    end

    sort_teardown(sorted_oa_values)
  end

  def bubble_sort(sorted_deck_numbered)
    deck_sorted = false

    until deck_sorted
      deck_sorted = true
      (sorted_deck_numbered.length - 1).times do |i|
        if sorted_deck_numbered[i][0] > sorted_deck_numbered[i + 1][0]
          deck_sorted = false
          card_to_switch = sorted_deck_numbered[i + 1]
          sorted_deck_numbered[i + 1] = sorted_deck_numbered[i]
          sorted_deck_numbered[i] = card_to_switch
        end
      end
    end
    sorted_deck_numbered
  end

  def merge_sort(sorted_deck_numbered)
    #add merge sort here
  end

  def sort_teardown(sorted_deck_numbered)
    sorted_deck_numbered.map do |card|
      card[1]
    end
  end

end

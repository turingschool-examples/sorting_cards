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

  def sort
    deck_sorted = false
    sorted_deck_numbered = cards_to_numbers(@cards.clone)
    ###add code to change below to the hash created

    until deck_sorted #setup for numbers add functionality for cards
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

    sorted_deck_numbered.map do |card|
      card[1]
    end
  end

  def cards_to_numbers(deck)
    deck_to_num = Array.new

    deck.each do |card|
      if card.value == "Jack"
        index_value = 11.0
      elsif card.value == "Queen"
        index_value = 12.0
      elsif card.value == "King"
        index_value = 13.0
      elsif card.value == "Ace"
        index_value = 14.0
      else
        index_value = card.value.to_f
      end

      if card.suit == "Clubs"
        index_value += 0.1
      elsif card.suit == "Diamonds"
        index_value += 0.2
      elsif card.suit == "Spades"
        index_value += 0.3
      else
        index_value += 0.4
      end
      deck_to_num << [index_value, card]
    end
    deck_to_num
  end


end

# card_1 = Card.new("4","Hearts") 1st
# card_2 = Card.new("Ace", "Spades") 5th
# card_3 = Card.new("5", "Diamonds") 2nd
# card_4 = Card.new("Jack", "Clubs") 3rd
# card_5 = Card.new("Ace", "Diamonds") 4th
#

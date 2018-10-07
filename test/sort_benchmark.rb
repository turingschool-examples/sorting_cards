require 'benchmark'
require './lib/deck'
require './lib/card'

card_1 = Card.new("Ace", "Spades")
card_2 = Card.new("10", "Clubs")
card_3 = Card.new("2", "Hearts")
card_4 = Card.new("5", "Hearts")
card_5 = Card.new("1", "Diamonds")
card_6 = Card.new("3", "Hearts")
card_7 = Card.new("Jack", "Diamonds")
card_8 = Card.new("4", "Clubs")
card_9 = Card.new("Queen", "Clubs")
card_10 = Card.new("King", "Spades")
card_11 = Card.new("Ace", "Hearts")
card_12 = Card.new("King", "Clubs")
card_13 = Card.new("2", "Hearts")
card_14 = Card.new("10", "Hearts")
card_15 = Card.new("King", "Diamonds")
card_16 = Card.new("5", "Hearts")
card_17 = Card.new("Jack", "Clubs")
card_18 = Card.new("7", "Clubs")
card_19 = Card.new("Queen", "Clubs")
card_20 = Card.new("Queen", "Spades")


cards = [
  card_1,
  card_2,
  card_3,
  card_4,
  card_5,
  card_6,
  card_7,
  card_8,
  card_9,
  card_10,
  card_11,
  card_12,
  card_13,
  card_14,
  card_15,
  card_16,
  card_17,
  card_18,
  card_19,
  card_20
]

deck_1 = Deck.new(cards)
deck_2 = Deck.new(cards)
deck_3 = Deck.new(cards)
deck_4 = Deck.new(cards)

Benchmark.bm do |x|
  x.report("bubble_sort:        ") { deck_1.sort }
  x.report("reverse_bubble_sort:") { deck_2.sort(reverse: true) }
  x.report("merge_sort:         ") { deck_3.merge_sort }
  x.report("reverse_merge_sort: ") { deck_4.merge_sort(reverse: true) }
end

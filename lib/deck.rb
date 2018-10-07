require "./lib/card"
require "pry"

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def sort
    to_be_sorted = cards
    n = to_be_sorted.length - 1
    loop do
      bool = false
      n.times do |index|
        b = to_be_sorted[index]
        c = to_be_sorted[index + 1]
        if b.total_value > c.total_value
          to_be_sorted[index] = c
          to_be_sorted[index + 1] = b
          bool = true
        end
      end
      if !bool
        break
      end
    end
    to_be_sorted
  end

end

class Card
  attr_reader :value, :suit, :cards, :card_sum
  require 'pry'
  def initialize(value, suit)
    @value = value
    @suit = suit
    card_reference = {
                      "Clubs" => 1,
                      "Diamonds" => 2,
                      "Hearts" => 3,
                      "Spades" => 4,
                      "2" => 100,
                      "3" => 200,
                      "4" => 300,
                      "5" => 400,
                      "6" => 500,
                      "7" => 600,
                      "8" => 700,
                      "9" => 800,
                      "10" => 900,
                      "Jack" => 1000,
                      "Queen" => 1100,
                      "King" => 1200,
                      "Ace" => 1300
                      }
    @card_sum = card_reference[value] + card_reference[suit]
  end

  # def sum_sort(cards)
  #
  # loop do
  #   shuffled = false
  #   4.times do |i|
  #     if cards[i].card_sum > cards[i + 1].card_sum
  #       cards[i].card_sum, cards[i + 1].card_sum = cards[i + 1].card_sum, cards[i].card_sum
  #       shuffled = true
  #     end
  #   end
  #   break if not shuffled
  # end
  # cards
  #
  # end


end

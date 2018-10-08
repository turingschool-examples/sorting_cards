#require 'minitest/autorun'
#require 'minitest/pride'
require './lib/deck'
require './lib/card'
require 'pry'

card_1 = Card.new("4","Hearts")
card_2 = Card.new("Ace", "Spades")
card_3 = Card.new("5", "Diamonds")
card_4 = Card.new("Jack", "Clubs")
card_5 = Card.new("Ace", "Diamonds")
card_1.gsub("Hearts","1")
#create a replace method for an array
deck = [{:suit=>"Hearts", :value=>"3"}, {:suit=>"Diamonds", :value=>"5"}]


p replace(deck)

#hearts = 1, diamonds = 3, clubs = 2, Spades = 4
#11 = jack, 12 = queen, 13 = king, ace = 14
#4 hearts, 5 diamonds, jack clubs, ace diamonds, ace Spades
#4*1, 5*3, 11*2, 14*3, 14*4
#4, 15, 22, 42, 56

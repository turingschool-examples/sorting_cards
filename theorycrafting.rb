require './lib/card'
require './lib/guess'
require './lib/deck'


card_1 = Card.new("4","Hearts")
card_2 = Card.new("Ace", "Spades")
card_3 = Card.new("5", "Diamonds")
card_4 = Card.new("Jack", "Clubs")
card_5 = Card.new("Ace", "Diamonds")
deck = Deck.new([card_1, card_2, card_3, card_4, card_5])

p "card_1 = #{deck.cards[0].value} of #{deck.cards[0].suit}"
p "card_2 = #{deck.cards[1].value} of #{deck.cards[1].suit}"
p "card_3 = #{deck.cards[2].value} of #{deck.cards[2].suit}"
p "card_4 = #{deck.cards[3].value} of #{deck.cards[3].suit}"
p "card_5 = #{deck.cards[4].value} of #{deck.cards[4].suit}"
#
unsorted_deck = ["#{deck.cards[0].value} of #{deck.cards[0].suit}",
"#{deck.cards[1].value} of #{deck.cards[1].suit}",
"#{deck.cards[2].value} of #{deck.cards[2].suit}",
"#{deck.cards[3].value} of #{deck.cards[3].suit}",
"#{deck.cards[4].value} of #{deck.cards[4].suit}"]
puts "Unsorted Deck: #{unsorted_deck}"



#puts deck.cards[1].value.replace "14" <--------- THIS WORKS! how do we get it to conditionally iterate this through the deck and return a new array of converted values, like "14 of Spades"?
unsorted_deck_converted = unsorted_deck.map do |value, suit|
  if deck.cards.include?("Jack") == true
    "Jack".replace "11"
  end
end
# this gets way too complicated and we can't figure out how to get the right return value after hours on this. let's throw everything into a freaking hash and give it an integer value,
# then we can combine the suit and value of a card into a single quality, like "worth" or "rank" or something
p unsorted_deck_converted

# # let's try converting just the fourth card into integer values from 2 to 14
# if deck.cards == "Jack"
#   then card.4_value = "11"
# end

# unsorted_deck_converted = unsorted_deck.map do |value, suit|
#   if value == "Jack"
#     value = "11"
#   elsif value == "Queen"
#     value = "12"
#   elsif value == "King"
#     value = "13"
#   elsif value == "Ace"
#     value = "14"
#   end
#   if suit == "Clubs"
#     suit = "1"
#   elsif suit == "Diamonds"
#     suit = "2"
#   elsif suit == "Hearts"
#     suit = "3"
#   elsif suit == "Spades"
#     suit = "4"
#   end
# end
#
# puts unsorted_deck_converted

# def replace(card)
#   duration = deck.count - 1
#   for duration.times do |sub|
#     #weighted_deck = deck.gsub(/deck/, 'Diamonds' => '3', 'Hearts' => '1', 'Clubs' => '2', 'Spades' => '2')
#     if card.suit = "Hearts"
#       card.suit.gsub("Hearts","1")
#
#     end
#   end
# end


   # def test_that_it_replaces
   #   card_1 = Card.new("4","Hearts")
   #   card_2 = Card.new("Ace", "Spades")
   #   card_3 = Card.new("5", "Diamonds")
   #   card_4 = Card.new("Jack", "Clubs")
   #   card_5 = Card.new("Ace", "Diamonds")
   #   deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
   #   assert_equal "1", deck.replace(card_1)
   # end


def sort(array)
  duration = array.length

  loop do
    swapped = false

    (duration - 1).times do |i|
      if array[i] > array[i + 1 ]
        array[i], array[i + 1] = array[i + 1],array[i]
        swapped = true
      end
    end
    break if not swapped
  end
  array
end

card_1 = Card.new("4","Hearts")
card_2 = Card.new("Ace", "Spades")
card_3 = Card.new("5", "Diamonds")
card_4 = Card.new("Jack", "Clubs")
card_5 = Card.new("Ace", "Diamonds")
deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
#a = [1,2,3,4,4,5,5,1,2,6,2]
p sort(deck)

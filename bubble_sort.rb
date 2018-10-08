def bubble_sort(array)
  sorted_deck = array.length

  loop do


    swapped = false
    (sorted_deck-1).times do |x|
      array[x], array[x + 1] = array[x + 1], array[x]
    # goal is this order for card value [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]

    # we will be passing the Iteration 3 provided arguments which are:
    # card_1 = Card.new("4","Hearts")
    # card_2 = Card.new("Ace", "Spades")
    # card_3 = Card.new("5", "Diamonds")
    # card_4 = Card.new("Jack", "Clubs")
    # card_5 = Card.new("Ace", "Diamonds")
    # deck = Deck.new([card_1, card_2, card_3, card_4, card_5])

    # the argument we pass will be in the following value order:
    # ["4", "Ace", "5", "Jack", "Ace"]
    # note that the integers are strings
    # bubble sort will do this:
    # ["4", "Ace", "5", "Jack", "Ace"]
    # ["4", "5", "Ace", "Jack", "Ace"]
    # ["4", "5", "Jack", "Ace", "Ace"] (we'll worry about suit later, which would further analyse the last two elements)

    # sorted_deck = {|a, b| a <=> b }

#end

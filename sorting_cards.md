1. Create empty array sorted_cards
1. Create hash smallest_card - populate with the first card and array-value from valued_deck, effectively putting the first card in there, regardless of value.
1. Iterate through the steps below for the size of the hash.
1. Iterate through valued_deck hash, looking at each value (in this hash, key is Card and value is a 2-item array representing the "scores" for the card value and suit: [value, suit]). Use .each.
  1. compare score_array[0] (this is the card value) with the smallest_card.value[0]. If score_array is smaller than smallest_card, replace the item in smallest_card with the key/value pair from the valued_cards.
  1. If it is equal to smallest_card, compare score_array[1] with smallest_card.value[1] - compare the suits. If score_array is smaller than smallest_card, replace the item in smallest_card with the key/value pair from the valued_cards.
  1. Don't need an else statement - then it will just move to the next iteration which is what we want.
  1. This whole iteration will find the smallest card in the deck. At the end of this - the Card gets <<'d on to the sorted_cards array. THEN we have to repeat!

____________________
## Merge Sort
1. Need to translate cards into something sortable. - Use floats.
1. Array of arrays? Each array contains [[card1, sort-order], [card2, sort-order], etc].



----------------
### Questions/To Do
1. The values_sort_order should be constants. Read up on how these are defined. All caps? >> Done. All caps, outside the method.
1. Suits are sorted alphabetically. Can we simplify this somehow? Not need the suits_sort_order? >> Done via using floats instead.
1. Combine the value + suit score into one by making the suit the decimal point e.g. 2 of Clubs is 0.0, 2 of Hearts is 0.2. Then can compare in one score and don't need to separate out suit. >> Done.
1. Look at all instances of .each. Could use .map or other?
1. Go through methods. Does each have a single responsibility that can be described concisely?
1. Research unit vs integration testing in minitest

require 'pry'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
   @cards.size
  end

  def sort
      #if left card rank > right card rank, swap their position
      loop do
        deck_length = @cards.length
        switcheroo = false
        bubblez
        break if switcheroo == false
      end
      @cards
    end

  def bubblez
    deck_length = @cards.length
        (deck_length-1).times do |i|
          if @cards[i].rank > @cards[i+1].rank
            switcheroo = true
            a = @cards[i]
            b = @cards[i+1]
            @cards[i+1] = a
            @cards[i] = b
          end
        end
      end


        #stop iterating when no swaps occur during a full iteration of the loop


#   def merge_sort
#     #take a list, like the array @cards
#     @cards
# #     # two big steps in merge_sort
# #     # 1) continuously split the list into halves, until we have several lists with just one item in them
# #         - don't worry if a list contains an odd number, just randomly pick which list to include the item in
# # how many iterations given 5 cards? (then try 'n' cards to engineer a reliable template)
#     @cards.count = 5
#     given_cards = @cards.count
#     loop do
#       all_groups = []
#       group_1 = @cards
#       group_1.each do |group_x|
#         group_(x+1) = [[group_x.take(given_cards / 2)], [group_x.drop(given_cards / 2)]]
#         all_groups << group_(x+1)
#       end
#     #......and on and on until each list only has one element
#       break if all_groups.last.count > 1
#     end
#     # now we should have several groups, with one element in each group.
#     # 2)repeatedly merge pairs of groups until all_paired_groups.count = @cards.count
#   end

#   def do_the_thing(array)
#     .....
#     => a= [asdfasdf],
#     b= [asdfasdf]
#     do_the_thing(a)
#     do_the_thing(b)
#
#   [1,2,3,4,5,6,7,8]    -
#       /       \         |
#   [1,2,3,4] [5,6,7,8]  -
#    /     \     /    \
# [1,2]  [3,4] [5,6] [7,8]
# /   \   / \   / \  /  \
# [1][2][3][4][5][6][7][8]
#
# #vocab
# #recursion =
# #base case = the break
# def array_deadpooler(array)
#     half = array.count / 2
#     a = array[0..half]
#     b = array[(half-1)..array.count]
# binding.pry
#       #sort here
#       return [a,b] if a.count == 1 && b.count == 1
#     [array_deadpooler(a),array_deadpooler(b)]
# end
#
#
#
# end
#
#
# def array_sorter
#   array_deadpooler().map




#end the Deck class
end

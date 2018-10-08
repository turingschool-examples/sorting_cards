require_relative './card'
require_relative './deck'
require_relative './guess'
require_relative './round'

class Game
  attr_reader   :turns, :refactored, :correct

  def initialize
    @turns      = 0
    @response   = []
    @refactored = []
    @correct    = "10 of Clubs"
  end

  def play
    introduction
    setup_game(@refactored.last)
  end

  def introduction
  puts "Welcome to Sorting Cards!"
  puts ":o"
  puts "Would you like to (p)lay, or (q)uit?"
  puts "> "
    user_response = $stdin.gets.chomp

    if user_response == "p"
      puts "let's see if you can guess correctly"
      puts "you'll have 3 guesses good luck!"
      puts ""
      puts "Please enter a card value between 2 - 10"
      puts "OR type out Jack, Queen or Ace"
      puts ">"
      value_guess
      puts "now, enter a suit in the same manner!"
      puts "type Clubs, Diamonds, Hearts, Spades"
      puts ">"
      suit_guess
      puts "nice!"

      new_response = ({value: "#{@response[0]}", suit: "#{@response[1]}"})
      @refactored << new_response

    elsif user_response == "q"
      puts "Ooh somebody's having an interesting day"
      puts "If this was by accident, would you like to"
      puts "start over? (y/n)"
      user_response_q = $stdin.gets.chomp

      if user_response_q == "y"
        puts "thank you, let's try again"
        play

      elsif user_response_q == "n"
        puts "Your loss, come back when you're feeling"
        puts "better :)"
        outro
        puts "Take it Easy"

      else user_response_q != "y" || "n"
        puts "this is not a value choice, try again"
        play
      end

    else user_response != "p" || "q"
      puts "This is not a valid choice, if you would"
      puts "like to play, please run program again and"
      puts "enter a (p) or a (q), Thanks :)"
    end
  end

  def try_again
    puts "Lets try again..."
    puts " "
    puts "That was turn number #{@turns}"
    puts " "
    puts "Enter a differenct card value between 2 - 10"
    puts "OR type out Jack, Queen or Ace"
    puts ">"
    value_guess
    puts "now, enter a suit in the same manner!"
    puts "type Clubs, Diamonds, Hearts, Spades"
    puts ">"
    suit_guess
    puts "Alrighty Then!"

    new_response_1 = ({value: "#{@response[-2]}", suit: "#{@response[-1]}"})
    @refactored << new_response_1
    setup_game(new_response_1)
  end

  def value_guess
    user_response_p = $stdin.gets.chomp
    @response << user_response_p
  end

  def suit_guess
    user_response_s = $stdin.gets.chomp
    @response << user_response_s
  end

  def setup_game(guess_hash)
    puts "Here is your current Guess:"
    correct_maybe = "#{guess_hash[:value]}" + " " + "of" + " " + "#{guess_hash[:suit]}"
    puts " "
    puts "#{correct_maybe}"
    puts " "
    puts "and your previous Guesses:"
    puts " "
    puts "#{@refactored}"
    puts " "

    if @correct == correct_maybe
      puts "AWESOME GUESS!!! You might have a career in this!"

    else @correct != correct_maybe
      puts "Close but no cigar... yet!"
      puts "This may be your last turn, find out on the next line... ->"
      puts " "
      @turns += 1
      try_again until @turns == 3
    end
  end

  def outro
    "You Know What!!! You get an A for effort"
  end
end

game = Game.new
game.play

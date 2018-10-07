require './lib/guess'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'

class SortingCards

  def initialize
    start
  end

  def start
    puts "=============================================="
    puts "Welcome to the amazing game, Sorting Cards...!"
    puts  "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    input = gets.chomp

    if input == "p"
      play
    elsif input == "i"
      instructions
    elsif input == "q"
      quit
    else
      puts "======================="
      puts "...Speak English please"
      puts " "
      start
    end
  end

  def play
    cards = [ Card.new("4", "Hearts"),
              Card.new("Ace", "Spades"),
              Card.new("5", "Diamonds"),
              Card.new("Jack", "Clubs"),
              Card.new("Ace", "Diamonds")
            ].shuffle

    deck = Deck.new(cards)
    @round = Round.new(deck)
    user_guess
  end

  def user_guess
    puts "=========================================="
    puts "Pick a card please, these are your options:"
    puts "c_1 = 4 of Hearts"
    puts "c_2 = Ace of Spades"
    puts "c_3 = 5 of Diamonds"
    puts "c_4 = Jack of Clubs"
    puts "c_5 = Ace of Diamonds"
    answer = gets.chomp
    card_hash = {}

# turn it into a case statement
    if answer == "c_1"
      card_hash = {value: "4", suit: "Hearts"}
    elsif answer == "c_2"
      card_hash = {value: "Ace", suit: "Spades"}
    elsif answer == "c_3"
      card_hash = {value: "5", suit: "Diamonds"}
    elsif answer == "c_4"
      card_hash = {value: "Jack", suit: "Clubs"}
    elsif answer == "c_5"
      card_hash = {value: "Ace", suit: "Diamonds"}
    elsif answer == "i"
      instructions
    elsif answer == "q"
      quit
    else
      puts "======================="
      puts "...Speak English please"
      puts " "
      start
    end

    puts "=========================="
    guess = @round.record_guess(card_hash)
    puts "your last guess: #{guess.response}"
    puts guess.feedback
    user_guess
  end

# correct

  def instructions
    puts "=========================================================================================="
    puts "This game, it's very easy my friend. Pick your card, from a deck of cards and make a guess."
    puts "Would you like to (p)lay, or (q)uit?"
    inst_input = gets.chomp
    if inst_input == "p"
      play
    elsif inst_input == "q"
      quit
    else
      puts "======================="
      puts "...Speak English please"
      puts " "
      start
    end
  end

  def quit
    puts "=================================="
    puts "Are you sure?, don't be scared...!"
    puts "y / n"
    input = gets.chomp
    if input == "n"
      start
    elsif input == "y"
      puts "========="
      puts "Ok, adios...!"
    else
      puts "======================="
      puts "...Speak English please"
      puts " "
      start
    end
  end

end

SortingCards.new

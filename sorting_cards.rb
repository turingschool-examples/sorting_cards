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
      puts "============================"
      puts "...Speak English please"
      puts " "
      start
    end
  end

  def play
    puts "==========================================================="
    puts "Would you like to try what card at the top of a deck is...?"
    puts "y / n"
    play_answer = gets.chomp
    if play_answer == "y"
      user_guess
    elsif play_answer == "n"
      puts "================================================"
      puts "Are you sure?, don't be scared...it will be fun!"
      puts "y / n"
      confirm_answer = gets.chomp
      if confirm_answer  == "n"
        user_guess
      else
        puts "========="
        puts "Ok bye !"
      end
    else
      puts "======================="
      puts "...Speak English please"
      puts " "
      start
    end
  end

  def user_guess
    puts "=========================================="
    puts "Pick a card please, this are your options:"
    puts "c_1 = 4 of Hearts"
      # c_1 = "4 of Hearts"
    puts "c_2 = Ace of Spades"
      # c_2 = "Ace of Spades"
    puts "c_3 = 5 of Diamonds"
      # c_3 = "5 of Diamonds"
    puts "c_4 = Jack of Clubs"
      # c_4 = "Jack of Clubs"
    puts "c_5 = Ace of Diamonds"
      # c_5 = "Ace of Diamonds"
    answer_2 = gets.chomp
    if answer_2 == "c_1"
    puts "=========================="
    puts "This is your guess: #{"4 of Hearts"}"
    #compare
    elsif answer_2 == "c_2"
      puts "=========================="
      puts "This is your guess: #{"Ace of Spades"}"
      #compare
    elsif answer_2 == "c_3"
      puts "=========================="
      puts "This is your guess: #{"5 of Diamonds"}"
      #compare
    elsif answer_2 == "c_4"
      puts "=========================="
      puts "This is your guess: #{"Jack of Clubs"}"
      #compare
    elsif answer_2 == "c_5"
      puts "=========================="
      puts "This is your guess: #{"Ace of Diamonds"}"
      #compare
    else
      puts "======================="
      puts "...Speak English please"
      puts " "
      start
    end
  end

  def compare
  end

  def instructions
    puts "=========================================================================================="
    puts "This game, it's very easy my friend. Pick your card, from a deck of cards and make a guess"
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
      puts "Ok bye !"
    else
      puts "======================="
      puts "...Speak English please"
      puts " "
      start
    end
  end

end

SortingCards.new

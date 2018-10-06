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
    puts "============================"
    puts "Welcome to Sorting cards...!"
    puts  "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    input = gets.chomp

    if input == "p"
      play
    elsif input == "i"
      instructions
    elsif input == "q"
      quit
    else
      puts "...Speak English please"
      start
    end

  end

  def play
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
      puts "...Speak English please"
      start
    end
  end

  def instructions
    puts "=========================================================================================="
    puts "This game, it's very easy my friend. Pick your card, from a deck of cards and make a guess"
    puts  "Would you like to (p)lay, or (q)uit?"
    input = gets.chomp

    if input == "p"
      play
    elsif input == "q"
      quit
    else
      puts "======================="
      puts "...Speak English please"
      start
    end
  end


end

SortingCards.new

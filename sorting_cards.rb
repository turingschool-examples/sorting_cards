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
    p "Welcome to Sorting cards"
    p  "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    input = gets.chomp

    if input == "p"
      play
    elsif input == "i"
      instructions
    elsif input == "q"
      quit
    else
      p "Speak english please"
    end

  end

  def play
  end

  def quit
    p "Are you sure?, don't be scared !"
    input = gets.chomp
    if input == "n"
      start
    elsif input == "y"
      p "Ok bye !"
    end
  end

  def instructions
    p  "pick your card and guess"
    start
  end


end

SortingCards.new

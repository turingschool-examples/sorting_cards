require './lib/guess'
require './lib/card'
require 'rspec'

RSpec.describe Guess do

  it "exists" do 
    card = Card.new("10", "Hearts") 
    guess = Guess.new("10 of Hearts", card)

    expect(guess).to be_instance_of(Guess) 
  end
  
  it "has attributes" do
    card = Card.new("10", "Hearts") 
    guess = Guess.new("10 of Hearts", card)

    expect(guess.card).to eq(card)
    expect(guess.response).to eq("10 of Hearts") 
  end
  
  it "correct?" do 
    card = Card.new("10", "Hearts") 
    guess = Guess.new("10 of Hearts", card)

    expect(guess.correct?).to eq(true)
  end

  it "feedback" do
    card = Card.new("10", "Hearts") 
    guess = Guess.new("10 of Hearts", card)

    expect(guess.feedback).to eq("Correct!")
  end
  
  it "exists" do 
    card = Card.new("Queen", "Clubs") 
    guess = Guess.new("2 of Diamonds", card)

    expect(guess).to be_instance_of(Guess) 
  end
  
  it "has attributes" do
    card = Card.new("Queen", "Clubs") 
    guess = Guess.new("2 of Diamonds", card)

    expect(guess.card).to eq(card)
    expect(guess.response).to eq("2 of Diamonds") 
  end
  
  
  
  # require'pry';binding.pry
  # xit "is correct"
  #   expect(guess.correct?).to eq(false)
  #   expect(guess.feedback).to eq("Incorrect.")
 end



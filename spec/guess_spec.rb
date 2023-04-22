require './lib/card'
require './lib/guess'
require 'rspec'

RSpec.describe Guess do
  
  it "exists and has attributes" do
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)
    expect(guess).to be_instance_of(Guess)
    expect(card).to be_instance_of(Card)
  end

  it 'can make a guess' do 
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)
    expect(guess.card).to eq(card)
  end

  it 'can make a guess' do 
    guess = Guess.new("10 of Hearts", ten_of_hearts)
    expect(guess.card).to eq(ten_of_hearts)
  end
  
  it "can give feedback for a guess" do
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)
    expect(guess.correct?).to eq(false)
    
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    expect(guess.correct?).to eq(true)
  end

  it "can give feedback" do 
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)
    expect(guess.feedback).to eq("Incorrect.")

    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    expect(guess.feedback).to eq("Correct!")
  end
end

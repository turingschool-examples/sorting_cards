require './lib/card'
require './lib/guess'
require 'rspec'

RSpec.describe Guess do

  it "exists" do
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    expect(guess).to be_instance_of(Guess)
  end
   
  it 'can make a correct guess' do 
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    guess.card
    expect(guess.response).to eq("10 of Hearts")
    expect(guess.feedback).to eq("Correct!")
  end 

  it "can have an incorrect guess" do
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)
    guess.card
    expect(guess.response).to eq("2 of Diamonds")
    expect(guess.feedback).to eq("Incorrect!")
  end
end
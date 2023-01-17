require './lib/card'
require './lib/deck'
require 'rspec'

RSpec.describe Guess do

  it "exists" do 
    card_1 = Card.new("3","Hearts") 
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")

    expect(deck).to be_instance_of(Deck) 
  end
  
  # it "has attributes" do
  #   card = Card.new("10", "Hearts") 
  #   guess = Guess.new("10 of Hearts", card)

  #   expect(guess.card).to eq(card)
  #   expect(guess.response).to eq("10 of Hearts") 
  # end
end
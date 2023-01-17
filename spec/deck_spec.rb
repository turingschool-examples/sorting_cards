require './lib/card'
require './lib/deck'
require 'rspec'

RSpec.describe Deck do

  it "exists" do 
    card_1 = Card.new("3","Hearts") 
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck).to be_instance_of(Deck) 
  end
  
  it "has attributes" do
    card_1 = Card.new("3","Hearts") 
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    
    expect(deck.cards).to eq(cards)
  end
  
  
  
  
  # expect(deck.count).to eq(3) 
  # require'pry'; binding.pry
end
require './lib/card'
require 'rspec'

RSpec.describe Card do

  it "exists" do
    card = Card.new("Ace", "Spades")
    expect(card).to be_instance_of(Card)
  end
  
  it "has a value" do
    card = Card.new("Ace", "Spades")
    expect(card.value).to eq("Ace")
  end
  
  # require'pry';binding.pry
  xit "has a suit" do
    card = Card.new("Ace", "Spades")
    expect(card.suit).to eq("Spades")
  end
end
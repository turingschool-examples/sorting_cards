require './lib/card'
require 'rspec'

RSpec.describe Card do

  it "exists" do
    card = Card.new("Ace", "Spades")
    expect(card).to be_instance_of(Card)
  end

  it "has a value and suit" do
    card = Card.new("Ace", "Spades")
    expect(card.value).to eq("Ace")
    expect(card.suit).to eq("Spades")
  end
end

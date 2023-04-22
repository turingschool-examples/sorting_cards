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

  it "has a number for value" do
    card = Card.new("7", "Spades")
    expect(card.point_value).to eq(74)
  end
end

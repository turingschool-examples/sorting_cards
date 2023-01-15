require './lib/card'
require 'rspec'

RSpec.describe Card do

  it "exists" do
    card = Card.new("Ace", "Spades")
    require'pry';binding.pry
    expect(card).to be_instance_of(Card)
  end

  xit "has a value" do
    card = Card.new("Ace", "Spades")
    expect(card.value).to eq("Ace")
  end

  xit "has a suit" do
    card = Card.new("Ace", "Spades")
    expect(card.suit).to eq("Spades")
  end
end
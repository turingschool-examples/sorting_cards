require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'
require 'rspec'

RSpec.describe Round do
  it "exists" do
    round = Round.new
    expect(round).to be_instance_of(Round)
  end

  it "contains a deck" do
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    expect(Deck.new).to eq([card_1, card_2])
  end

require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'
require 'rspec'

RSpec.describe Round do
  it "exists" do
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    expect(round).to be_instance_of(Round)
  end

  it "has a deck" do 
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    expect(round.deck).to eq(deck)
  end

  it "starts with no guesses" do 
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    expect(round.guesses).to eq([])
  end

  it "has a current card" do
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    expect(round.current_card).to eq(card_1)
  end

  it "has a new guess" do 
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})
    expect(new_guess).to be_instance_of(Guess)
    expect(new_guess.class).to eq(Guess)    
    expect(new_guess.correct?).to eq(true)    
  end

  it "knows the number of guesses when they are correct" do 
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})
    expect(round.guesses).to eq([new_guess])
    expect(round.number_correct).to eq(1)
    expect(round.current_card).to eq(card_2)
  end

  it "can record an incorrect guess" do 
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})
    new_guess2 = round.record_guess({value: "Jack", suit: "Diamonds"})
    expect(round.guesses).to eq([new_guess, new_guess2])
    expect(round.guesses.count).to eq(2)
  end

  it "can give feedback" do
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})
    new_guess2 = round.record_guess({value: "Jack", suit: "Diamonds"})
    expect(round.guesses.last.feedback).to eq("Incorrect.")
  end

  it "can knows the total number of correct guesses" do
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})
    new_guess2 = round.record_guess({value: "Jack", suit: "Diamonds"})
    expect(round.number_correct).to eq(1)
  end

  it "can knows percent of correct guesses" do
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})
    new_guess2 = round.record_guess({value: "Jack", suit: "Diamonds"})
    expect(round.percent_correct).to eq(50.0)
  end
end

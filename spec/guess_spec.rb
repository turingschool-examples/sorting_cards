require './lib/card'
require './lib/guess'
require 'rspec'
require 'pry'

RSpec.describe Guess do
  it 'exists' do
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    # require 'pry'; binding.pry
    expect(guess).to be_instance_of(Guess)
  end

  it 'has a card' do
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    expect(guess.card).to eq(card)
  end

  it 'has a response' do
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    expect(guess.response).to eq("10 of Hearts")
  end

  it 'has a guess' do
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    expect(guess.response).to eq("10 of Hearts")
    # binding.pry
    expect(guess.correct?).to eq(true)
  end

  it 'has an incorrect guess' do
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)
    # expect(guess.card).to eq(card)
    expect(guess.response).to eq("2 of Diamonds")
    expect(guess.correct?).to eq(false)
    #
    # expect(guess.feedback).to eq("Incorrect")
  end

  it 'has feedback' do
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    expect(guess.feedback).to eq("Correct!")
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)
    expect(guess.feedback).to eq("Incorrect")
  end
end

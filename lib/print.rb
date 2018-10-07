require_relative 'standard_playing'

class Print

  CORRECT_REACTIONS = ["Isn't this game fun?", "Are you psychic?", "Incredible!"].shuffle.cycle
  INCORRECT_REACTIONS = ["Not it.", "Not the card I was thinking of.", "Nope."].shuffle.cycle
  TOO_LOW_HINTS = ["Why so low?", "Think bigger."].shuffle.cycle
  TOO_HIGH_HINTS = ["That guess was just too much.", "Think smaller."].shuffle.cycle
  DIFF_COLOR_HINTS = ["You didn't even get the color right", "Wrong color."].shuffle.cycle
  DIFF_SUIT_HINTS = ["Wrong suit.", "That card doesn't suit me."].shuffle.cycle

  def self.welcome(timing = false)
    puts "Welcome to Fun Guessing Game,
    \t\tthe card guessing game where you guess cards!"
    sleep(1) if timing
    puts "\nFirst, I, Ruby, will select a card..."
    sleep(4) if timing
    puts "\n\t\t...Oh, wow, that's a good one..."
    sleep(0.5) if timing
    puts "(Enter 'o' at any time to see options)"
    puts "\nReady, set, guess!"
  end

  def self.print_options
    puts "\nEnter 'pry' to pry."
    puts "Enter 'exit' 'exit!' 'quit' '!!!' or 'q' to leave.\n\n"
  end

  def self.random_card
    "#{StandardPlaying::VALUES.sample} of #{StandardPlaying::SUITS.sample}"
  end

  def self.ask_for_valid
    puts "I'm looking for cards. Something like #{random_card} or #{random_card}."
  end

  def self.respond_to_guess(info)
    puts INCORRECT_REACTIONS.next
    hints = []
    hints << TOO_HIGH_HINTS.next if info[:value] == :high
    hints << TOO_LOW_HINTS.next if info[:value] == :low
    hints << DIFF_SUIT_HINTS.next if info[:suit] == :same_color
    hints << DIFF_COLOR_HINTS.next if info[:suit] == :diff_color
    puts hints.sample
  end

  def self.respond_to_correct
    print "That's the card!  "
    puts CORRECT_REACTIONS.next
  end

  def self.print_round_stats(round)
    i = round.num_guesses
    if i < 7
      puts "It only took you #{i} guesses!"
    else
      puts "It took you #{i} guesses, but you got it!"
    end
    puts "Want to play another round?"
    puts "Too late, I already picked another card."
    puts "It could be any card, except for ones I've picked in previous rounds."
    puts "Can you guess?"
  end

  def self.goodbye(percent_correct)
    puts "Goodbye! I hope you had fun!"
    print "#{percent_correct}\% of your guesses were correct. "
    puts reaction_from_percent(percent_correct)
    puts "Now exiting the most fun game ever concieved by anyone ever..."
  end

  def self.reaction_from_percent(percent)
    reactions = { 50  => "Astounding.",
                  30  => "Incredible.",
                  15  => "Well done.",
                  2   => "Better than random chance.",
                  0   => "At least you still have your looks."}


    reactions.each do |k,v|
      return v if k <= percent
    end
  end

end

require_relative 'ui'
require_relative 'standard_playing'
require_relative 'round'
require 'readline'
require'pry'


class FunGuessingGame < UI

  VALUES = Card::FACECARDS.keys + (2..10).map(&:to_s).to_a
  SUITS = Card::SUITDEC.keys
  CORRECT_REACTIONS = ["Isn't this game fun?", "Are you psychic?", "Incredible!"].shuffle.cycle
  INCORRECT_REACTIONS = ["Not it.", "Not the card I was thinking of.", "Nope."].shuffle.cycle
  TOO_LOW_HINTS = ["Why so low?", "Think bigger."].shuffle.cycle
  TOO_HIGH_HINTS = ["That guess was just too much.", "Think smaller."].shuffle.cycle
  DIFF_COLOR_HINTS = ["You didn't even get the color right", "Wrong color."].shuffle.cycle
  DIFF_SUIT_HINTS = ["Wrong suit.", "That card doesn't suit me."].shuffle.cycle




  def self.run
    setup
    welcome
    repl
  end

  private

  def self.repl
    while true
      input = Readline.readline("> ", true)
      break if UI::EXITKEYWORDS.include?(input)
      binding.pry if input == "pry"
      print_options if input == 'o'
      if valid_response?(input)
        new_guess = @round.record_guess(input)
        if new_guess.correct?
          respond_to_correct; print_round_stats
          @round = Round.new
        else
          respond_to_guess(evaluate_wrong_guess(new_guess))
        end
      else
        ask_for_valid
      end
    end
  end

  def self.setup
    @deck = StandardPlaying.new()
    @deck.shuffle!
    @round = Round.new(@deck)
    setup_auto_complete
  end

  def self.setup_auto_complete
    setup_responses_arr
    card_completer = proc { |s| @responses_arr.grep(/^#{Regex.escape(s)}/) }
    Readline.completion_append_character = ""
    Readline.completion_proc = card_completer
  end

  def self.setup_responses_arr
    @responses_arr = []
    VALUES.each do |value|
      @responses_arr << "#{value} of "
    end
    @responses_arr += SUITS


  end


  #print methods
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
    "#{VALUES.sample} of #{SUITS.sample}"
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

  def self.print_round_stats
    i = @round.num_guesses
    if i < 7
      puts "It only took you #{i} guesses!"
    else
      puts "It took you #{i} guesses, but you got it!"
    end
    puts "Want to play another round?"
    puts "Too late, I already picked another card."
    puts "It could be any card, except for the ones I've already picked."
    puts "Can you guess?"
  end

  #evaluation methods
  def self.evaluate_wrong_guess(guess)
    info = {}
    info[:value] = evaluate_value(guess)
    info[:suit] = evaluate_suit(guess)
    info
  end

  def self.evaluate_value(guess)
    gval, cval = guess.g_card.to_f.round, guess.card.to_f.round
    return :same if gval == cval
    return :high if gval > cval
    return :low
  end

  def self.evaluate_suit(guess)
    gsuit, csuit = guess.g_card.suit, guess.card.suit
    return :same if gsuit == csuit
    return :same_color if same_color?(gsuit, csuit)
    return :diff_color
  end

  def self.same_color?(suit1, suit2)
    color = %w(Clubs Hearts Diamonds Spades).zip([:b,:r,:r,:b]).to_h
    color[suit1] == color[suit2]
  end


  def self.valid_response?(input)
    a = input.split

    VALUES.include?(a[0]) && "of" == a[1] && SUITS.include?(a[2])
  end

end

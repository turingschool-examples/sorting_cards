Dir["lib/*.rb"].each {|file| require file }

deck = StandardPlaying.new()
round = Round.new(deck)

puts "Welcome to Card Guessing Game,
\t\tthe super fun card guessing game where you guess cards!"
sleep(1)
puts "\nFirst, I, Ruby, will select a card..."
sleep(4)
puts "\nGot a good one!"
sleep(0.5)
puts "\nOkay now, you guess!"
puts "(press o at any time to see options)"

loop do
end

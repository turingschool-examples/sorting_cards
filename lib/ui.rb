class UI
  EXITKEYWORDS = %w(exit exit! quit !!! q)
  def welcome
    "Hello! Please enter text below!"
  end
  def self.repl
      prompt = "> "
      while true
        print prompt
        input = gets.chomp
        break if EXITKEYWORDS.include?(input)
      end
  end
end

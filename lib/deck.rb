
class Deck
  attr_reader :contents

  def initialize(contents)
    @contents = contents
  end

  def cards
    contents
  end
  def count
    contents.count
  end
end

#The cards need to be made
#then placed into an array outside of the clss
#The deck need to be able to interact with the cards array
#

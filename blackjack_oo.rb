class Card
  attr_accessor :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def to_s
    "Card: #{suit}, #{value}"
  end
end

class Deck
  attr_accessor :deck

  def initialize
    @deck = []
    %w(D S C H).each do |suit|
      %w(2 3 4 5 6 7 8 9 10 J Q K A).each do |value|
        deck << Card.new(suit, value)
      end
    end
    scramble!
  end

  def scramble!
    deck.shuffle!
  end

  def to_s
    deck.each { |card| card.to_s }
  end

  def deal
    deck.pop
  end
end

class Hand
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def calculate_sum
    hand[]
  end
end

class Player

end

class Dealer

end

class Value

end

class Blackjack
  deck1 = Deck.new
  puts deck1.to_s

end




# calculate_the_sum

# hit

# dealt

# goes first

# choose

# stay

# deal

# repeat

# value_is_saved

# moves_to_dealer

# busts

# dealer_wins

# player_wins

# compare_the_sums



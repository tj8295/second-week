require 'rubygems'
# require 'pry'

class Card
  attr_accessor :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def to_s
    # "Card: #{suit}, #{value}"
    pretty_output
  end

  def pretty_output
    puts "The #{value} of #{find_suit}"
  end

  def find_suit
    ret_val = case suit
                      when 'H' then 'Hearts'
                      when 'D' then 'Diamonds'
                      when 'S' then  'Spades'
                      when 'C' then  'Clubs'
                    end
    ret_val
  end

  def actual_value

  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    %w(D S C H).each do |suit|
      %w(2 3 4 5 6 7 8 9 10 J Q K A).each do |value|
        cards << Card.new(suit, value)
      end
    end
    scramble!
  end

  def scramble!
    cards.shuffle!
  end

  def to_s
    cards.each { |card| card.to_s }
  end

  def deal_one
    cards.pop
  end

  def size
    cards.size
  end
end

module Hand

  def show_hand
    puts "---#{name}'s Hand ---"
    cards.each do |card|
      puts "=> #{card.to_s}"
    end
    puts "=> Total: #{total}"
  end

  def add_card(new_card)
    cards << new_card
  end
  # assumes an array of cards named.
  def total
    arr = cards.map { |e| e.value }

    total = 0
    arr.each do |value|
      if value == 'A'
        total += 11
      elsif value.to_i == 0 # J, Q, K
        total += 10
      else
        total += value.to_i
      end
    end

    # correct for aces
    arr.select { |e| e == 'A' }.count.times do
      total -= 10 if total > 21
    end

    total
  end # end total method

  def compare_the_sums(hand_1, hand_2)
    if total(hand_1) > total(hand_2)

    end
  end
end   # end of hand class

class Player
  include Hand

  attr_accessor :name, :cards
  def initialize(n)
    @name = n
    @cards = []
  end

end

class Dealer
  include Hand

  attr_accessor :name, :cards

  def initialize
    @name = "Dealer"
    @cards = []
  end
end

# class Blackjack
#   attr_accessor :player, :dealer, :deck

#   def initialize
#     @deck = Deck.new
#     @player = Player.new
#     @dealer = Dealer.new
#   end

#   def run
#     deal_cards
#     show_flow
#     player_turn
#     dealer_turn
#     who_won?
#   end
# end

# game = Blackjack.new
# game.run

deck = Deck.new

 player = Player.new("Chris")
 player.add_card(deck.deal_one)
 player.add_card(deck.deal_one)
 player.show_hand
 player.total

 dealer = Dealer.new
 dealer.add_card(deck.deal_one)
 dealer.add_card(deck.deal_one)
 dealer.show_hand
 dealer.total


# choose

# stay


# repeat



# busts

# dealer_wins

# player_wins




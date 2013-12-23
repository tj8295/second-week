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
    "The #{value} of #{find_suit}"
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
end # End Card class

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

  def is_busted?
    total > 21
  end

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
end   # end of hand class

class Player
  include Hand

  attr_accessor :name, :cards
  def initialize(name)
    @name = name
    @cards = []
  end

  def show_flop
    show_hand
  end

end

class Dealer
  include Hand

  attr_accessor :name, :cards

  def initialize
    @name = "Dealer"
    @cards = []
  end

  def show_flop
    puts "--- Dealer's Hand ---"
    puts "=> First card is hidden"
    puts "=> Second card is #{cards[1]}"
  end
end

class Blackjack
  attr_accessor :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    @player = Player.new("Player1")
    @dealer = Dealer.new
  end

  def set_player_name
    puts "What is your name?"
    player.name = gets.chomp
  end

  def deal_cards
    player.add_card(deck.deal_one)
    dealer.add_card(deck.deal_one)
    player.add_card(deck.deal_one)
    dealer.add_card(deck.deal_one)
  end

  def show_flop
    player.show_flop
    dealer.show_flop
  end

  def blackjack_or_bust?(player_or_dealer)
    if player_or_dealer.total == 21
      if player_or_dealer.is_a?(Dealer)
        puts "Sorry, dealer hit plackjack. #{player.name} loses"
      else
        puts "Congratulations, you hit 21! #{player.name} win!"
      end
      exit
    elsif player_or_dealer.is_busted?
      if player_or_dealer.is_a?(Dealer)
        puts "Dealer busts, you win. #{player.name} wins."
      else
        puts "Sorry, #{player.name} busted."
      end
      exit
    end
  end

  def player_turn
    puts "#{player.name}'s turn."
    blackjack_or_bust?(player)
    while !player.is_busted?
      puts 'What would you like to do? 1) hit 2) stay'
      hit_or_stay = gets.chomp

      if !['1', '2'].include?(hit_or_stay)
        puts "Error: you must enter 1 or 2"
      next
      end

      if  hit_or_stay == "2"
        puts "#{player.name} chose to stay."
        break
      end

      new_card  = deck.deal_one
      puts "Dealing card to player: #{new_card}: #{new_card}"
      player.add_card(new_card)
      puts "#{player.name}'s' total is now: #{player.total}"
      blackjack_or_bust?(player)
    end
    puts "#{player.name} stays at #{player.total}"
  end

  def dealer_turn
    puts "Dealer's turn."
    blackjack_or_bust?(dealer)

    while dealer.total < 17
      new_card = deck.deal_one
      puts "Dealing new card for dealer: #{new_card}"
      dealer.add_card(new_card)
      puts "Dealer total: #{dealer.total}"
      blackjack_or_bust?(dealer)
    end
    puts "Dealer stays at #{dealer.total}."
  end

  def compare_hands
    dealer.show_hand
    player.show_hand
    puts ""

    if dealer.total > player.total
      puts "Sorry, dealer wins."
    elsif dealer.total > player.total
      puts "Congrautlations, you win"
    else
      puts "Push"
    end
  end

  def start
    set_player_name
    deal_cards
    show_flop
    player_turn
    dealer_turn
    compare_hands
  end
end

game = Blackjack.new
game.start



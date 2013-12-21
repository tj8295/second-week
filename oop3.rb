# 1. Have detailed requirements or specifications in written form.
# 2. Extract major nouns -> classes
  # Card
  # Deck
  # Player
  # Dealer
# 3. Extract major verbs -> instance methods
# 4. Group instance methods into classes

Blackjack
Card game
Card
Player
Dealer
Game
Value
Deck

class Card
  attr_accessor :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def to_s
    "This is the card! #{suit}, #{value}"
  end
end

class Deck
  attr_accessor :cards

  def initialize(num_decks)
    @cards = []
    ['H', 'D', 'S', 'C'].each do |suit|
      ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].each do |face_value|
        @cards << Card.new(suit, face_value)
      end
    end
    @cards = @cards * num_decks
    scramble!
  end

  def scramble!
    cards.shuffle!
  end

  def deal
    cards.pop
  end
end

class Player

end

class Dealer

end

# Game engine that orchestrates the rest of the objects
class Blackjack
  attr_accessor :player, :dealer, :deck

  def initialize
    @player = player.new("Bob")
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def run # procedural part
    deal_cards
    show_flow
    players.each do |player|
      player_turn(player)
    end
    player_turn
    dealer_turn
    who_won?
  end
end

game = Blackjack.new
game.run

# Blackjack.new.run


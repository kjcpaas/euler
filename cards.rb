class InvalidCardError < StandardError
  attr_accessor :message
  
  def initialize
    @message = "Cannot create invalid card."
  end
end

class Card
  CLUB = "C"
  SPADE = "S"
  HEART = "H"
  DIAMOND = "D"
  
  SUITS = [ CLUB, SPADE, HEART, DIAMOND ]
  
  VALUES = (2..9).map(&:to_s) + [ 'T', 'J', 'Q', 'K', 'A']
  
  attr_accessor :suit, :value
  
  def initialize(value, suit)
    if SUITS.include?(suit) && VALUES.include?(value)
      @suit = suit
      @value = value
    else
      puts "#{value} #{suit}"
      raise InvalidCardError
    end
  end
  
  def inspect
    "#{@value}#{@suit}"
  end
end


class Deck
  def initialize
    @cards = []
    
    Card::VALUES.each do |value|
      Card::SUITS.each do |suit|
        @cards << Card.new(value, suit)
      end
    end
    
    shuffle
  end
  
  def shuffle
    @cards.shuffle!
  end
  
  def draw
    @cards.pop
  end
end

class Hand
  def initialize(cards)
    @cards = cards.clone
  end
  
  def inspect
    @cards.inspect
  end
end
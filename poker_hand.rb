require "cards"

class InvalidPokerHandError; end

class PokerHand < Hand
  include Comparable
  
  NUM_CARDS = 5
  
  CARD_RANKS = {}
  Card::VALUES.each_with_index do |val, i|
    CARD_RANKS[val] = i
  end
  
  SINGLES = 0
  ONE_PAIR = 1
  TWO_PAIR = 2
  TRIO = 3
  STRAIGHT = 4
  FLUSH = 5
  FULL_HOUSE = 6
  QUAD = 7
  STRAIGHT_FLUSH = 8
  ROYAL_FLUSH = 9
  TYPE_NAMES = {
    SINGLES => "Singles",
    ONE_PAIR => "One Pair",
    TWO_PAIR => "Two Pair",
    TRIO => "Trio",
    STRAIGHT => "Straight",
    FLUSH => "Flush",
    FULL_HOUSE => "Full House",
    QUAD => "Quad",
    STRAIGHT_FLUSH => "Straight Flush",
    ROYAL_FLUSH => "Royal Flush"
  }
  
  def initialize(cards)
    super
    raise InvalidPokerHandError if @cards.length != NUM_CARDS
  end
  
  def type
    case self.value_frequencies
    when [1, 4]
      return QUAD
    when [2, 3]
      return FULL_HOUSE
    when [1, 1, 3]
      return TRIO
    when [1, 2, 2]
      return TWO_PAIR
    when [1, 1, 1, 2]
      return ONE_PAIR
    when [1, 1, 1, 1, 1]
      card_vals = self.card_values
      
      is_straight = CARD_RANKS[card_vals[-1]] - CARD_RANKS[card_vals[0]] == 4
      is_flush = self.card_suits.uniq.length == 1
      
      if is_flush && is_straight
        return card_vals[-1] == 'A' ? ROYAL_FLUSH : STRAIGHT_FLUSH
      elsif is_flush
        return FLUSH
      elsif is_straight
        return STRAIGHT
      else
        return SINGLES
      end
    end
  end
  
  TYPE_NAMES.each do |key, value|
    method_name = value.gsub(" ", "_").downcase + "?"
    define_method(method_name) do
      self.type == key
    end
  end


  def <=>(other)
    result = self.type <=> other.type
    return result unless result == 0
    
    my_values = self.rank_values_by_freq
    other_values = other.rank_values_by_freq
    
    while !my_values.empty?
      result = my_values.pop <=> other_values.pop
      
      return result unless result == 0
    end
    
    return 0
  end
  
  def rank_values_by_freq
    card_vals = self.card_values
    max_freq = self.value_frequencies.max
    
    high_freq = []
    low_freq = []
    
    card_vals.uniq.each do |val|
      if card_vals.count(val) == max_freq
        high_freq << val
      else
        low_freq << val
      end
    end
    
    return (low_freq.map { |val| CARD_RANKS[val] }).sort  + (high_freq.map { |val| CARD_RANKS[val] }).sort
  end
  
  def value_frequencies
    values = self.card_values
    values.uniq.map { |val| values.count(val) }.sort 
  end
  
  def card_suits
    @cards.map(&:suit)
  end

  def card_values
    @cards.map(&:value).sort_by { |val| CARD_RANKS[val] }
  end
end
require "helpers.rb"
require "benchmark"
require "poker_hand"

FILENAME = "euler54.txt"

RESULT = {-1 => "LOSE", 0 => "TIE", 1 => "WIN"}

exp_ans = 376

time_taken = Benchmark.measure do
  ans = 0

  File.open(FILENAME).each do |line|
    p1_cards = []
    p2_cards = []
    line.strip.split(" ").each do |card_face|
      if p1_cards.length < 5
        p1_cards << Card.new(*card_face.split(''))
      else
        p2_cards << Card.new(*card_face.split(''))
      end
    end
    
    p1_hand = PokerHand.new(p1_cards)
    p2_hand = PokerHand.new(p2_cards)
    
    ans += 1 if p1_hand > p2_hand
    #puts "#{p1_hand.inspect} (#{PokerHand::TYPE_NAMES[p1_hand.type]}) vs. #{p2_hand.inspect} (#{PokerHand::TYPE_NAMES[p2_hand.type]}) #{RESULT[p1_hand <=> p2_hand]}"
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

require "helpers.rb"
require "benchmark"

exp_ans = 162
FILENAME = 'euler42.txt'
BASE = ?A - 1

def word_score(word)
  word.split(//).inject(0) { |score, letter| score + (eval("?#{letter}") - BASE) }
end

time_taken = Benchmark.measure do
  TRI_NUMS = [0]
  ans = 0
  words = File.read(FILENAME).split(",").map{ |word| eval(word) }
  
  words.each do |word|
    score = word_score(word)
    while score > TRI_NUMS[-1]
      TRI_NUMS << TRI_NUMS[-1] + TRI_NUMS.length
    end
    
    ans += 1 if TRI_NUMS.include?(score)
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

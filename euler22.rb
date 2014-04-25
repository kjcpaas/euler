require "helpers.rb"
require "benchmark"

exp_ans = 871198282
FILENAME = "euler22.txt"
BASE = ?A - 1

def word_score(word)
  word.split(//).inject(0) { |score, letter| score + (eval("?#{letter}") - BASE) }
end

time_taken = Benchmark.measure do
  words = File.read(FILENAME).strip.split(",").map{ |word| eval(word) }.sort
  ans = 0
  
  words.each_with_index do |word, i|
    ans += word_score(word) * (i + 1)
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"
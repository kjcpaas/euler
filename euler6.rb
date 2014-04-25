require "helpers.rb"
require "benchmark"

exp_ans = 25164150
LIMIT = 100

time_taken = Benchmark.measure do
  ans = add((1..LIMIT).to_a)**2 - (1..LIMIT).inject{|sum, i| sum + i**2}
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"
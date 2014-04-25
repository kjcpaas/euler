require "helpers.rb"
require "benchmark"

exp_ans = 	1366
exp = 1000

time_taken = Benchmark.measure do
  digits = (2 ** 1000).to_s.split(//).map { |d| d.to_i }
  ans = add(digits)
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"
# Project Euler #1
# Find the sum of all the multiples of 3 and 5 below 1000
require "helpers.rb"
require "benchmark"

exp_ans = 233168

time_taken = Benchmark.measure do
  
  ans = 0
  (1...1000).each do |i|
    ans += i if (i % 3 == 0 or i % 5 == 0) 
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"
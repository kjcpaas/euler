require "helpers.rb"
require "benchmark"

exp_ans = 648
n = 100

time_taken = Benchmark.measure do
  ans = add(n.fact.to_s.split(//).map{ |digit| digit.to_i })
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"
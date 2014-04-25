require "helpers.rb"
require "benchmark"

exp_ans = 232792560

time_taken = Benchmark.measure do
  ans = (2..20).to_a.inject(1){ |curr_lcm, n| curr_lcm.lcm(n) }
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"
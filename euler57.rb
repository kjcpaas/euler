require "helpers.rb"
require "benchmark"
require "fraction"

exp_ans = 153

LIMIT = 1000

time_taken = Benchmark.measure do
  ans = 0
  
  current = 1.to_fr
  
  LIMIT.times do
    current = 1.to_fr + 1.to_fr/(1.to_fr + current)
    if current.num.to_s.length > current.den.to_s.length
      ans += 1
    end
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

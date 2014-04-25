require "helpers.rb"
require "benchmark"

exp_ans = 669171001
target = 1001

best = [0, 0, 0]

time_taken = Benchmark.measure do
  ans = 1
  n = 3
  
  while n <= target
    ans += 4 * (n ** 2) - 6 * (n - 1)
    n += 2
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"
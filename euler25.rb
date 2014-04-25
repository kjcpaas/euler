require "helpers.rb"
require "benchmark"

exp_ans = 4782
target = 1000
ans = 1

time_taken = Benchmark.measure do
  count = 2
  f_prev = 1
  f_curr = 1
  while f_curr.to_s.length < target
    f_prev, f_curr = f_curr, f_curr + f_prev
    count += 1
  end
  
  ans = count
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"
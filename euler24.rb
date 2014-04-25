require "helpers.rb"
require "benchmark"

exp_ans = "2783915460"
target = 1000000
highest_digit = 9
ans = ""

time_taken = Benchmark.measure do
  remaining = target - 1
  digits = (0..highest_digit).to_a
  while digits.length > 0
    ans << digits.delete_at(remaining / (digits.length - 1).fact).to_s
    remaining %= (digits.length).fact
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"
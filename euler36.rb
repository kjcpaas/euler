require "helpers.rb"
require "benchmark"

exp_ans = 872187
LIMIT = 1000000

time_taken = Benchmark.measure do
  ans = 0
  LIMIT.times do |n|
    if n.palindrome? and (n.to_s(2)).palindrome?
      puts "Found: #{n} -> #{n.to_s(2)}"
      ans += n
    end
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

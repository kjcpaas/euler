require "helpers.rb"
require "benchmark"

exp_ans = 9110846700

LIMIT = 1000

time_taken = Benchmark.measure do
  ans = 0
  
  LIMIT.times do |n|
    if n > 0
      ans = (ans + (n ** n)) % (10 ** 10)
    end
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

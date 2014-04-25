require "helpers.rb"
require "benchmark"

# Project Euler # 2
# Find the sum of even Fibonacci numbers less than 4 million

# Store Fibobacci terms (for faster access)
exp_ans = 4613732

time_taken = Benchmark.measure do
  fibs = [0, 1]

  while fibs[-1] < 4000000 do
    fibs << fibs[-1] + fibs[-2]
  end
  
  ans = add(fibs[0...-1].select { |f| f % 2 == 0 } )
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"
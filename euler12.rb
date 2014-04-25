require "helpers.rb"
require "benchmark.rb"

exp_ans = 76576500
TARGET = 500

time_taken = Benchmark.measure do
  n = 2
  tri = 1
  
  while tri.divisors.length <= TARGET
    tri += n
    n += 1
  end

  check_answer(exp_ans, tri)
end

puts "Time taken(seconds): #{time_taken}"
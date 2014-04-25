require "helpers.rb"
require "benchmark"

#COLLATZ_HASH = { 1 => [1] }
COLLATZ_HASH = { 1 => 1 }

def collatz(n)
  unless COLLATZ_HASH[n]
    next_seq = (n % 2 == 0) ? collatz(n / 2) : collatz(3 * n + 1)
    COLLATZ_HASH[n] = next_seq + 1
  end
  COLLATZ_HASH[n]
end

exp_ans = 837799
limit = 1000000

time_taken = Benchmark.measure do
  max = [0, 0] #start, n
  
  limit.times do |start|
    next if start < 1
    seq = collatz(start)
    max = [start, seq] if seq > max[1]
  end
  
  puts "Found max at #{max[0]} with n = #{max[1]}."
  check_answer(exp_ans, max[0])
end

puts "Time taken(seconds): #{time_taken}"
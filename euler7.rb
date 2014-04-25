require "helpers.rb"
require "benchmark.rb"

exp_ans = 104743
target = 10001

primes = [2]
curr_num = 3

time_taken = Benchmark.measure do
  while primes.length < target do
    div_index = 0
    
    is_prime = true
    while curr_num.sqrt >= primes[div_index]
      if curr_num % primes[div_index] == 0
        is_prime = false
        break
      end
      div_index += 1
    end
    primes << curr_num if is_prime
    curr_num += 2
  end
  
  ans = primes[-1]
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

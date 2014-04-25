require "helpers.rb"
require "benchmark.rb"

exp_ans = 142913828922
LIMIT = 2000000

time_taken = Benchmark.measure do
  primes = Integer.prime_sieve(LIMIT)
  
  ans = 0
  
  primes.each_with_index do |is_prime, i|
    ans += i if is_prime
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

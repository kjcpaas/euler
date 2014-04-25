require "helpers.rb"
require "benchmark"

exp_ans = 997651

LIMIT = 1000000

time_taken = Benchmark.measure do
  ans, num_primes_limit = 0, 0
  
  primes = []
  Integer.prime_sieve(LIMIT).each_with_index do |is_prime, i|
    if is_prime
      primes << i
      if num_primes_limit == 0 and add(primes) > LIMIT
        num_primes_limit = primes.length
      end
    end
  end
  
  found = false
  num_primes_limit.downto(1).each do |num_primes|
    break if found
    start = 0
    sum = add(primes[start...(start + num_primes)])
    while sum < LIMIT do
      if primes.include?(sum)
        found = true
        puts "Found #{sum} with #{num_primes} consecutive primes."
        #puts "The numbers are #{primes[start...(start + num_primes)].inspect}"
        ans = sum
        break
      end
      start += 1
      sum = add(primes[start...(start + num_primes)])
    end
     
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

require "helpers.rb"
require "benchmark"

exp_ans = -59231
target = 1000

best = [0, 0, 0]

time_taken = Benchmark.measure do
  is_prime = Integer.prime_sieve(target ** 2)
  
  a = -1*(target - 1)
  
  while a < target do
    b = -1*(target - 1)
    
    while b < target do
      n = 0
      
      while is_prime[n ** 2 + a * n + b]
        n += 1
      end
      
      if n - 1 > best[2]
        best = [a, b, n - 1]
      end
      
      b += 1
    end
    
    a += 1
  end
  
  ans = best[0] * best[1]
  puts "Found answer at n^2 + #{best[0]}n + #{best[1]} with n until #{best[2]}"
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"
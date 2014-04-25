require "helpers.rb"
require "benchmark"

exp_ans = 5777

time_taken = Benchmark.measure do
  ans = 0
  
  primes = [2]
  n = 3
  
  while ans == 0 do
    is_prime = true
    primes.each do |p|
      if p > Math.sqrt(n)
        primes << n
        break
      elsif n % p == 0
        is_prime = false
        break
      end
    end
    
    unless is_prime
      square = 1
      found = false
      while !found and square < Math.sqrt(n/2.0)
        if primes.include?(n - 2 * (square ** 2))
          found = true
        end
        square += 1
      end
      
      unless found
        ans = n
      end
    end
    
    n += 2
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

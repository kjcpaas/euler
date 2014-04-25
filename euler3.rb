require "helpers.rb"
require "benchmark"

NUM = 600851475143
exp_ans = 6857


PRIMES = [2]

def is_prime(n)
  if n > 1
    PRIMES.each do |p|
      if p > Math.sqrt(n)
        return ( PRIMES << n )
      end
    end
  end
  return false
end

time_taken = Benchmark.measure do
  number = NUM
  div = 2
  
  while number > 1 do
    if is_prime(div) and number % div == 0
      number /= div
    else
      div % 2 == 0 ? div += 1 : div += 2
    end
  end
  
  ans = div
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"
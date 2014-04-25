require "helpers.rb"
require "benchmark"

exp_ans = 134043

FACTORS = {2 => [2]}

time_taken = Benchmark.measure do
  ans = 0
  N = 4
  
  primes = [2]
  curr_num = 3
  
  count = 0
  
  while true do
    factors = []
    remaining = curr_num
    
    primes.each do |p|
      break if p > Math.sqrt(remaining)
      while remaining % p == 0 do
        remaining /= p
        factors << p
        
        if FACTORS[remaining]
          factors += FACTORS[remaining]
          remaining = 1
        end
      end
    end
    
    if factors.empty?
      primes << curr_num
      FACTORS[curr_num] = [curr_num]
    else
      FACTORS[curr_num] = factors.uniq
    end
    
    if FACTORS[curr_num].length == N
      count += 1
    else
      count = 0
    end
    
    if count == N
      ans = curr_num - N + 1
      break
    end
    
    curr_num += 1
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

require "helpers.rb"
require "benchmark"

exp_ans = 748317
LIMIT = 11

IS_PRIME = Integer.prime_sieve(1000000)

def trunc_right(n)
  while n > 0
    return false if !IS_PRIME[n]
    n /= 10
  end
  
  return true
end

def trunc_left(n)
  while n > 0
    return false if !IS_PRIME[n]
    n = n.to_s[1..-1].to_i
  end
  
  return true
end

time_taken = Benchmark.measure do
  ans = 0
  count = 0
  n = 10
  
  while count < LIMIT do
    n += 1
    if IS_PRIME[n]
      if trunc_left(n) and trunc_right(n)
        puts "Found: #{n}"
        count += 1
        ans += n
      end
    end
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

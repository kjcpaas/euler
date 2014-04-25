require "helpers.rb"
require "benchmark"

exp_ans = 55
LIMIT = 1000000

def circulars(n)
  quals = [n]
  
  digits = n.to_s.split("")
  (digits.length).times do |partition_index|
    if partition_index > 0
      quals << (digits[partition_index..-1] + digits[0...partition_index]).join("").to_i
    end
  end
  
  quals.uniq
end

time_taken = Benchmark.measure do
  IS_PRIME = Integer.prime_sieve(LIMIT)
  CIRCULAR_PRIME = Array.new(LIMIT, false)
  
  ans = 0
  
  (1...LIMIT).each do |n|
    if IS_PRIME[n] and !CIRCULAR_PRIME[n]
      circs = circulars(n)
      
      prime_circs = circs.select { |c| IS_PRIME[c] }
      if prime_circs.length == circs.length
        circs.each do |c|
          CIRCULAR_PRIME[c] = true
        end
        
        ans += circs.length
        puts "Circular primes found: #{circs.inspect}"
      end
    end
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

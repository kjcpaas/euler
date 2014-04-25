require "helpers.rb"
require "benchmark"

exp_ans = 7652413

# 9-digit and 8-digitals can't be prime since they are all divisible by 9
# Start with 7-digit pandigitals

time_taken = Benchmark.measure do
  IS_PRIME = Integer.prime_sieve(7654322)
  ans = 0
  
  7.downto(1).each do |num_digits|
    found = false
    numbers = (1..num_digits).to_a.permutation.to_a.reverse.map { |n| n.join("").to_i }
    
    numbers.each do |n|
      if IS_PRIME[n]
        ans = n
        found = true
        break
      end
    end
    
    break if found
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

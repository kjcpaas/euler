require "helpers.rb"
require "benchmark"

exp_ans = "296962999629"

LIMIT = 10000

time_taken = Benchmark.measure do
  ans = 0
  
  primes = []
  Integer.prime_sieve(LIMIT).each_with_index do |is_prime, i|
    primes << i if is_prime and i > 1000
  end
  
  primes.length.times do |a_index|
    a = primes[a_index]
    b_index = a_index + 1
    found = false
    while b_index < primes.length - 1 and not found do
      b = primes[b_index]
      if a.perms?(b)
        c = 2 * b - a
        if primes.include?(c) and a.perms?(c)
          puts "Found: #{a}, #{b}, #{c}."
          ans = a.to_s + b.to_s + c.to_s
          puts a
          found = true if a > 1487
          break
        end
      end
      break if found
      b_index += 1 
    end
    break if found
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

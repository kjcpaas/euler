require "helpers.rb"
require "benchmark"

exp_ans = 26241

LIMIT = 0.1

time_taken = Benchmark.measure do
  diag_nums = 5.0
  diag_primes = 3
  
  n = 3
  
  while diag_primes / diag_nums >= LIMIT do
    n += 2
    
    [1, 2, 3].each do |a|
      diag_primes += 1 if (n ** 2 - a * n + a).prime?
    end
    
    diag_nums += 4
    #puts "#{n}: #{diag_primes / diag_nums}"
  end
  
  ans = n
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

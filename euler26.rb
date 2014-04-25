require "helpers.rb"
require "benchmark"

exp_ans = 983
target = 1000
best = [1, 0]

time_taken = Benchmark.measure do
  target.times do |d|
    if d > 0
      divisor = d
      while divisor % 2 == 0 do
        divisor /= 2
      end
      
      while divisor % 5 == 0 do
        divisor /= 5
      end
      
      next if divisor == 1
      
      num = 9
      while num % divisor != 0
        num = num * 10 + 9
      end
      
      cycle_count = num.to_s.length
      
      if cycle_count > best[1]
        best = [d, cycle_count]
      end
    end
  end
  
  ans = best[0]
  puts "Hit found at #{best[0]} with cycle count = #{best[1]}"
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"
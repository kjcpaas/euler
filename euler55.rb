require "helpers.rb"
require "benchmark"

exp_ans = 249

class Integer
  def reverse
    self.to_s.reverse.to_i
  end
end

LIMIT = 10000

time_taken = Benchmark.measure do
  ans = 0
  
  LIMIT.times do |n|
    next if n == 0
    
    count = 1
    curr_num = n + n.reverse
    
    while !curr_num.palindrome? && count < 50
      count += 1
      curr_num += curr_num.reverse
    end
    
    ans += 1 if count >= 50
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

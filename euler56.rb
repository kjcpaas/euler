require "helpers.rb"
require "benchmark"

exp_ans = 972

class Integer
  def digit_sum
    return 0 if self == 0
    (self / 10).digit_sum + (self % 10)
  end
end

LIMIT = 100

time_taken = Benchmark.measure do
  ans = 0
  
  1.upto(LIMIT - 1) do |a|
    1.upto(LIMIT - 1) do |b|
      curr = (a ** b).digit_sum
      ans = curr if curr > ans
    end
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

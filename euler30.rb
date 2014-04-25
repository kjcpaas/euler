require "helpers.rb"
require "benchmark"

exp_ans = 443839
exp = 5

def sum_digit_power(n, exp)
  n.to_s.split(//).inject(0) { |sum, d| sum + (d.to_i) ** exp }
end

time_taken = Benchmark.measure do
  ans = 0
  limit = 9
  
  while limit < sum_digit_power(limit, exp)
    limit = limit * 10 + 9
  end
  
  limit = sum_digit_power(limit, exp)
  
  (10..limit).each do |n|
    if n == sum_digit_power(n, exp)
      puts "Found #{n} with exponent = #{exp}"
      ans += n
    end
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"
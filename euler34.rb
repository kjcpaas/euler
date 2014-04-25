require "helpers.rb"
require "benchmark"

exp_ans = 40730

FACTORIALS = (0..9).to_a.map(&:fact)

def sum_digit_fact(num)
  num.to_s.split("").inject(0) { |sum, digit| sum + FACTORIALS[digit.to_i] }
end

time_taken = Benchmark.measure do
  max = 99
  ans = 0
  
  while max < sum_digit_fact(max) do
    puts "#{max} #{sum_digit_fact(max)}"
    max = max * 10 + 9
  end
  
  puts "#{max} #{sum_digit_fact(max)}"
  max = sum_digit_fact(max)
  
  10.upto(max).each do |n|
    if sum_digit_fact(n) == n
      puts "Found #{n}..."
      ans += n
    end
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

require "helpers.rb"
require "benchmark"

exp_ans = 9183
range = 2..100

time_taken = Benchmark.measure do
  powers = []
  
  range.each do |a|
    range.each do |b|
      powers << a ** b
    end
  end
  
  ans = powers.uniq.length
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"
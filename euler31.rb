require "helpers.rb"
require "benchmark"

exp_ans = 73682
DENOMS = [1, 2, 5, 10, 20, 50, 100, 200]
target = 200

time_taken = Benchmark.measure do
  amounts = Array.new(target + 1, 0)
  amounts[0] = 1
  
  DENOMS.each do |denom|
    (denom..target).each do |amount|
      amounts[amount] += amounts[amount - denom]
    end
  end
  
  ans = amounts[target]
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"
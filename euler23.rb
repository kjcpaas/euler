require "helpers.rb"
require "benchmark"

exp_ans = 4179871
limit = 28123
ans = 0


DIVISORS = {1 => [1], 2 => [1, 2]}

time_taken = Benchmark.measure do
  abunds = (1..limit).select { |n| n.abundant? }
  sums = []
  
  abunds.length.times do |i|
    j = i
    while j < abunds.length
      break if abunds[i] + abunds[j] > limit
      sums << abunds[i] + abunds[j]
      j += 1
    end
  end
  
  ans = add((1..limit).to_a) - add(sums.uniq)
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"
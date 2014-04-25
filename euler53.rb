require "helpers.rb"
require "benchmark"

exp_ans = 4075
LIMIT = 1000000

time_taken = Benchmark.measure do
  ans = 0
  
  (1..100).each do |n|
    start = n / 2
    if n.even? and n.C(start) > LIMIT
      ans += 1
      start -= 1
    end
    
    start.downto(0) do |r|
      n.C(r)> LIMIT ? ans += 2 : break # + 2 because of symmetry
    end
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

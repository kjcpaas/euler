require "helpers.rb"
require "benchmark"

exp_ans = 210
LIMIT = 1000000

time_taken = Benchmark.measure do
  d = ""
  curr_num = 0
  
  while d.length <= LIMIT
    d += curr_num.to_s
    curr_num += 1
  end

  ans = multiply((0..6).map{ |n| d[10 ** n].chr.to_i })
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

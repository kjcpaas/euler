require "helpers.rb"
require "benchmark"


# To go to the other corner of an n x n lattice,
# you must go n times right and n times down
# for a total of 2n moves.
# n of those goes to the right and n goes down.
# Hence, the formula is:
# # of possible moves = (2n)Cn

exp_ans = 137846528820
n = 20

time_taken = Benchmark.measure do
  ans = (2*n).C(n)
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"
require "helpers.rb"
require "benchmark"

exp_ans = 1533776805

def hex(n)
  n * (2 * n - 1)
end

def inv_tri(t_n)
  ((Math.sqrt(8 * t_n + 1) - 1)/2.0)
end

def is_tri(t_n)
  n = inv_pent(p_n)
  n.to_i == n
end

def inv_pent(p_n)
  ((Math.sqrt(24 * p_n + 1) + 1)/6.0)
end

def is_pent(p_n)
  n = inv_pent(p_n)
  n.to_i == n
end

FIRST_THP_NUM = 40755

time_taken = Benchmark.measure do
  n = 1 #for x
  ans = 0
  
  while ans <= FIRST_THP_NUM do
    h_n = hex(n)
    
    if is_pent(h_n)
      puts "Found: T(#{inv_tri(h_n).to_i}) = P(#{inv_pent(h_n).to_i}) = H(#{n}) = #{h_n}"
      ans = h_n
    end
    
    n += 1
  end
  
  ans = h_n
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

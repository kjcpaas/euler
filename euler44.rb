require "helpers.rb"
require "benchmark"

exp_ans = 5482660

def pent(n)
  (n * (3 * n - 1)) / 2
end

def inv_pent(p_n)
  ((Math.sqrt(24 * p_n + 1) + 1)/6.0)
end

def is_pent(p_n)
  n = inv_pent(p_n)
  n.to_i == n
end

time_taken = Benchmark.measure do
  limit = nil
  found = false
  
  n_index = 1
  
  while limit.nil? or ( limit and 3 * n_index <= limit )
    n = pent(n_index)
    
    m_index = limit ? inv_pent(n - limit).to_i : 1
    while pent(m_index) < ( limit || n) do
      m = pent(m_index)
      
      # B < D: B = m & D = n
      if limit.nil? and is_pent(m + n) and is_pent(2 * m + n)
        A, B = m + n, m
        limit = n
      end
      
      # D < B: D = m & B = n
      if is_pent(m + n) and is_pent(m + 2 * n)
        A, B = m + n, n
        limit = limit.nil? ? m : [limit, m].min
      end
      m_index += 1
    end
    
    n_index += 1
  end
  
  ans = limit
  check_answer(exp_ans, ans)
  puts "===================="
  puts "Found:\tA = #{A}\n\tB = #{B}\n\tA - B = #{A - B}\n\tA + B = #{A + B}"
  puts "===================="
end

puts "Time taken(seconds): #{time_taken}"

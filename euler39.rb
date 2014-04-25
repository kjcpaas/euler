require "helpers.rb"
require "benchmark"

exp_ans = 840
LIMIT = 1000

time_taken = Benchmark.measure do
  best = [0, 0]
  
  LIMIT.times do |p|
    if p > 6
      right_triangles = []
      (p/2).downto(1) do |c|
        (1..(c/2)).each do |a|
          b = p - c - a
          if a ** 2 + b ** 2 == c ** 2
            right_triangles << [a, b, c]
          end
        end
      end
      
      if right_triangles.length > 0
        puts "#{p}: #{right_triangles.inspect}"
      end
      
      if right_triangles.length > best[1]
        best = [p, right_triangles.length]
      end
    end
  end
  
  ans = best[0]
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

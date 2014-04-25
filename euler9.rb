require "helpers.rb"
require "benchmark.rb"

exp_ans = 31875000
target = 1000

time_taken = Benchmark.measure do
  found = false
  c_range = 1...((target/2.0).ceil)

  c_range.each do |c|
    a_range = 1...((c/2.0).ceil)
    a_range.each do |a|
      b = target - c - a
      break unless b > c - a
      if a ** 2 + b ** 2 == c ** 2
        ans = a * b * c
      
        puts "Found a = #{a}, b = #{b}, c = #{c}"
        check_answer(exp_ans, ans)
      
        found = true
        break
      end
    end
    break if found
  end

end

puts "Time taken(seconds): #{time_taken}"

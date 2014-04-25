require "helpers.rb"
require "benchmark"

exp_ans = 45228

# a < b so a < 100
# Also, b must have 3 to 4 digits

time_taken = Benchmark.measure do
  perms = (1..9).to_a.permutation
  pandigitals = []
  perms.each do |curr_perm|
    1.upto(2).each do |b_start|
      
      a = curr_perm[0...b_start].join("").to_i
      (b_start + 3).upto(b_start + 4).each do |c_start|
        b = curr_perm[b_start...c_start].join("").to_i
        c = curr_perm[c_start..-1].join("").to_i
        
        break if c < b
        
        if a * b == c
          puts "#{a} x #{b} = #{c}"
          pandigitals << c
        end
      end
    end
  end
  
  ans = add(pandigitals.uniq)
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

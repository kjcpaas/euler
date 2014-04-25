require "helpers.rb"
require "benchmark"

exp_ans = 932718654

time_taken = Benchmark.measure do
  ans = 0
  
  9.downto(1).each do |start|
    found = false
    
    next_digits = []
    (1..8).to_a.permutation.each do |perm|
      next_digits << perm.join("")
    end
    
    next_digits.reverse!
    
    next_digits.each do |nd|
      sequence = start.to_s + nd
      
      (1..3).each do |n_end|
        seq = sequence.clone
        n = seq[0..n_end].to_i
        curr = n
        found = true
        while seq.length > 0
          if curr.to_s == seq[0...curr.to_s.length]
            seq.gsub!(curr.to_s, "")
          else
            found = false
            break
          end
          curr += n
        end
          
        if found
          puts sequence
          ans = sequence.to_i
          break
        end
      end
      
      break if found
    end
    
    break if found
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

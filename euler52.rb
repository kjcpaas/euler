require "helpers.rb"
require "benchmark"

exp_ans = 142857

LIMIT = 6

def sort_digits(n)
  sorted_digits = n.to_s.split('').sort.join('')
  sorted_digits.empty? ? '0' : sorted_digits
end

time_taken = Benchmark.measure do
  ans = 0
  found = false
  multiples = []
  n = 1
  power = 0
  
  while not found do
    multiples = (1...6).map{ |i| n * i}
    sorted_digits = multiples.map{ |m| sort_digits(m) }
    
    if sorted_digits[-1].to_s.length > sorted_digits[0].to_s.length
      power += 1
      n = 10 ** power
      next
    end
    
    if sorted_digits.uniq.length == 1
      found = true
      break
    end
    n += 1
  end
  
  puts "Found: #{multiples.inspect}"
  ans = n
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

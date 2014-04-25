require "helpers.rb"
require "benchmark"

exp_ans = 16695334890

DIVISORS = [17, 13, 11, 7, 5, 3, 2]

def next_append(num_string = "", pands = [], hash = {})
  if num_string.pandigital?
    if num_string.length == 10
      pands << num_string.to_i
    elsif num_string.length == 9
      (1..9).each do |i|
        next_append(i.to_s + num_string, pands, hash)
      end
    else
      curr_div_index = [num_string.length - 2, 0].max
      curr_div = DIVISORS[curr_div_index]
      key = num_string[0..1].to_i
      if hash[curr_div][key]
        hash[curr_div][key].each do |multiple|
          next_append((multiple/100).to_s + num_string, pands, hash)
        end
      end
    end  
  end
end


time_taken = Benchmark.measure do
  multiples_hash = {}
  
  DIVISORS.each do |div|
    if div != DIVISORS[0]
      curr_num = div
      multiples_hash[div] = {}
      while curr_num < 1000 do
        multiples_hash[div][curr_num % 100] ||= [] 
        multiples_hash[div][curr_num % 100] << curr_num
        curr_num += div
      end
    end
  end
  
  pands = []
  curr_num = DIVISORS[0]
  while curr_num < 1000
    num_string = curr_num.to_s
    while num_string.length < 3
      num_string = "0" + num_string
    end
    next_append(num_string, pands, multiples_hash)
    curr_num += DIVISORS[0]
  end
  puts pands
  
  ans = add(pands)
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

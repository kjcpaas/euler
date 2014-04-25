require "helpers.rb"
require "benchmark"

exp_ans = 906609

time_taken = Benchmark.measure do
  ans = 0

  (100..999).each do |num1|
    (100..999).each do |num2|
      product = num1 * num2
      if product.palindrome? and product > ans
        ans = product
      end
    end
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"
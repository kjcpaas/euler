require "helpers.rb"
require "benchmark"

exp_ans = 31626
limit = 10000

time_taken = Benchmark.measure do
  amicables = []
  limit.times do |a|
    if a > 1 and !amicables.include?(a)
      b = add(a.divisors(true))
      if a.amicable?(b)
        puts "#{a} and #{b} are amicable."
        amicables += [a, b]
      end
    end
  end
  
  ans = add(amicables)
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"
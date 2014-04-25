require "helpers.rb"
require "benchmark"

exp_ans = 100

class Fraction
  def naive_cancel
    new_den = self.den
    num_digits = self.num.to_s.split("")
    den_digits = self.den.to_s.split("")
    num_digits.uniq.each do |n_d|
      if (d_d = den_digits.delete(n_d))
        if den_digits.length == 0
          new_den = d_d.to_i
        else
          new_den = den_digits[0].to_i
        end
        
        if num_digits.uniq.length == 1
          return Fraction.new(n_d.to_i, new_den)
        else
          num_digits.delete(n_d)
          return Fraction.new(num_digits[0].to_i, new_den)
        end
      end
    end
    nil
  end
end

time_taken = Benchmark.measure do
  product = Fraction.new(1)
  (11...100).each do |num|
    next if num % 10 == 0
    ((num + 1)...100).each do |den|
      next if den % 10 == 0
      fraction = Fraction.new(num, den)
      if fraction.naive_cancel == fraction
        puts "Found #{fraction}"
        product *= fraction
      end
    end
  end
  
  ans = product.lowest_terms.den
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

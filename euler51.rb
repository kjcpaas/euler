require "helpers.rb"
require "benchmark"

exp_ans = 121313

LIMIT = 10000000
TARGET = 8
FIVE_DIGIT_MASKS = [ [ false, true, true, true, false],
                     [ true, false, true, true, false],
                     [ true, true, false, true, false],
                     [ true, true, true, false, false] ]

SIX_DIGIT_MASKS = [ [false, false, true, true, true, false],
                    [false, true, false, true, true, false],
                    [false, true, true, false, true, false],
                    [false, true, true, true, false, false],
                    [true, false, false, true, true, false],
                    [true, false, true, false, true, false],
                    [true, false, true, true, false, false],
                    [true, true, false, false, true, false],
                    [true, true, false, true, false, false],
                    [true, true, true, false, false, false] ]
 
time_taken = Benchmark.measure do
  prime_group = []
  
  primes = []
  Integer.prime_sieve(Math.sqrt(LIMIT).to_i).each_with_index do |is_prime, i|
    primes << i if is_prime
  end
  PRIMES = primes
  
  def prime?(n)
    return false if n < 2
    PRIMES.each do |p|
      break if p > Math.sqrt(n)
      return false if n % p == 0
    end
    true
  end
  
  def generate_number(constants, dyn, mask)
    number = []
    (mask.length - 1).downto(0) do |i|
      is_dyn = mask[i]
      
      if is_dyn
        number.unshift(dyn)
      else
        number.unshift(constants % 10)
        constants /= 10
      end
    end
    number.map(&:to_s).join('').to_i
  end
  
  def get_prime_group(constants, mask, min_number)
    group = []
    
    10.times do |dyn|
      number = generate_number(constants, dyn, mask)
      
      next if number < min_number
      
      if prime?(number)
        group << number
      end
    end
    
    group
  end
  
  1000.times do |const_digits|
    mask_group = const_digits < 100 ? FIVE_DIGIT_MASKS : SIX_DIGIT_MASKS
    if const_digits < 100
      mask_group = FIVE_DIGIT_MASKS
      min_number = 10000
    else
      mask_group = SIX_DIGIT_MASKS
      min_number = 100000
    end
    
    mask_group.each do |mask|
      prime_group = get_prime_group(const_digits, mask, min_number)
      break if prime_group.length >= TARGET
    end
    
    break if prime_group.length >= TARGET
  end
  
  puts "Found group: #{prime_group.inspect}"
  ans = prime_group[0]
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

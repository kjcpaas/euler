class Integer
  # Creates a prime sieve less than n
  def self.prime_sieve(n)
    primes = Array.new(n, true)
    [0, 1].each{ |i| primes[i] = false }
  
    den = 2
    while den < Math.sqrt(n) do
      if primes[den]
        (den ** 2).step(n, den) { |curr_num| primes[curr_num] = false }
      end
      den = (den == 2)? 3 : den + 2
    end
  
    primes
  end
  
  def prime?
    return false if self < 2 or self.even?
    3.step((self ** 0.5).floor, 2) do |div|
      return false if self % div == 0
    end
    return true
  end
  
  # square root
  def sqrt
    self ** 0.5
  end
  
  #n!
  def fact
    (self < 2) ? 1 : self * (self - 1).fact
  end
  
  #nPr
  def P(other)
    self.fact / other.fact
  end
  
  #nCr
  def C(other)
    self.P(other) / (self - other).fact
  end
  
  # Returns the greatest common denominator of 2 integers
  # Uses Euclidean algorithm
  def gcd(other)
  	return self.abs if other == 0
    other.gcd(self % other)
  end

  # Calculates LCM
  def lcm(other)
    ((self * other) / self.gcd(other)).abs
  end
  
  DIVISORS = {1 => [1], 2 => [1, 2]}
  # Calculates divisors
  def divisors(proper = false)
    unless DIVISORS[self]
      div = 2
      while self % div != 0 do
        if div > self.sqrt
          div = self
          break
        else
          div = (div == 2) ? 3 : div + 2
        end
      end
      
      #DIVISORS[div] = [1, div] unless DIVISORS[div]
      smaller_divs = (self / div).divisors
      all_divs = smaller_divs + smaller_divs.map{ |sd| sd*div }
      DIVISORS[self] = all_divs.sort.uniq
    end
    
    return proper ? DIVISORS[self][0...-1] : DIVISORS[self]
  end
  
  
  def perfect?
    add(self.divisors(true)) == self
  end

  def abundant?
    add(self.divisors(true)) > self
  end

  def deficient?
    add(self.divisors(true)) < self
  end
  
  def amicable?(other)
    self != other and add(self.divisors(true)) == other \
            and add(other.divisors(true)) == self
  end
  
  def add(array)
    array.inject { |sum, n| sum + n } || 0
  end
  private :add
end
require "helpers"

class Fraction
  attr_accessor :num, :den
  
  include Comparable
  
  def initialize(num, den = 1)
    @num = num
    @den = den
    raise ZeroDivisionError if den == 0
  end
  
  def inspect
    "#{num}/#{den}"
  end
  
  def to_s
    self.inspect
  end
  
  def *(other)
    Fraction.new(self.num * other.num, self.den * other.den)
  end
  
  def /(other)
    Fraction.new(self.num * other.den, self.den * other.num)
  end
  
  def +(other)
    g_div = self.den.gcd(other.den)
    new_num = self.num * (other.den / g_div) + other.num * (self.den / g_div)
    new_den = self.den * other.den / g_div
    Fraction.new(new_num, new_den).lowest_terms
  end
  
  def lowest_terms
    Fraction.new(@num / @num.gcd(@den), @den / @num.gcd(@den))
  end
  
  def reciprocal
    Fraction.new(@den, @num)
  end
  
  def <=>(other)
    self.num * other.den <=> other.num * self.den
  end
end

class Integer
  def to_fr
    Fraction.new(self)
  end
end
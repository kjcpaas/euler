require_relative "lib/helpers"

# Problem #5 (https://projecteuler.net/problem=5)
#
# Smallest multiple
#
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

benchmark_solution(232792560) do
  def gcd(a, b)
    return a if b == 0
    gcd(b, a%b)
  end

  def lcm(a, b)
    a * b / gcd(a, b)
  end

  answer = 1

  1.upto(20) do |i|
    answer = lcm(i, answer)
  end

  answer
end

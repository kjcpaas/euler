require_relative "lib/helpers"

# Problem #9 (https://projecteuler.net/problem=9)
#
# Special Pythagorean triplet
#
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
#
# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

# Assume c >= b >= a

LIMIT = 1000

benchmark_solution(31875000) do
  answer = 0
  (LIMIT - 2).downto((LIMIT/3.0).ceil) do |c|
    (1000 - c - 1).downto((c/2).ceil) do |b|
      a = 1000 - c - b
      if a ** 2 + b ** 2 == c ** 2
        p "a = #{a}, b = #{b}, c = #{c}"
        p "#{c ** 2}"
        answer = a * b * c
        break
      end
      break if answer > 0
    end
    break if answer > 0
  end
  answer
end

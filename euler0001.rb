require_relative "lib/helpers"

# Problem #1 (https://projecteuler.net/problem=1)
#
# Multiples of 3 and 5
#
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.

benchmark_solution(233168) do
  sum = 0
  (3...1000).each do |i|
    sum += i if (i % 3 == 0) || (i % 5 == 0)
  end
  sum
end

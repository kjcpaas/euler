require_relative "lib/helpers"

show_problem_info({
  number: 6,
  title: "Sum square difference",
  statement: %Q{
    The sum of the squares of the first ten natural numbers is,
    1^2 + 2^2 + ... + 10^2 = 385

    The square of the sum of the first ten natural numbers is,
    (1 + 2 + ... + 10)^2 = 55*2 = 3025

    Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

    Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
  },
  url: "https://projecteuler.net/problem=6"
})

benchmark_solution(25164150) do
  (50*(100 + 1)) ** 2 - 1.upto(100).inject { |sum, i| sum + i ** 2 }
end

require_relative "lib/helpers"

show_problem_info({
  number: 10,
  title: "Summation of primes",
  statement: %Q{
    The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

    Find the sum of all the primes below two million.
  },
  url: "https://projecteuler.net/problem=10"
})

LIMIT = 2000000

benchmark_solution(142913828922) do
  PRIMES = [2]
  number = 3

  while number < LIMIT do
    inner_limit = Math.sqrt(number)
    PRIMES.each do |prime|
      if prime > inner_limit
        PRIMES << number
        break
      end
      break if number % prime == 0
    end
    number += 2
  end

  PRIMES.inject { |sum, prime| sum + prime }
end

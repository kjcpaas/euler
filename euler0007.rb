require_relative "lib/helpers"

show_problem_info({
  number: 7,
  title: "10001st prime",
  statement: %Q{
    The sum of the squares of the first ten natural numbers is,

    By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

    What is the 10 001st prime number?
  },
  url: "https://projecteuler.net/problem=7"
})

LIMIT = 10001

benchmark_solution(104743) do
  primes = [2]
  number = 3

  while primes.length < LIMIT do
    inner_limit = Math.sqrt(number)
    primes.each do |prime|
      break if number % prime == 0
      if prime > inner_limit
        primes << number
        break
      end
    end
    number += 2
  end

  primes[-1]
end

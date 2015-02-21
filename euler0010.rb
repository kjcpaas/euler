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
  require_relative "lib/integer_extensions"

  class Integer
    include IntegerExtensions
  end

  sum = 0
  Integer.prime_sieve(LIMIT).each_with_index do |is_prime, i|
    sum += i if is_prime
  end
  sum
end

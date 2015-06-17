require_relative "lib/helpers"

show_problem_info({
  number: 3,
  title: "Largest prime factor",
  statement: %Q{
    The prime factors of 13195 are 5, 7, 13 and 29.

    What is the largest prime factor of the number 600851475143?
  },
  url: "https://projecteuler.net/problem=3"
})

benchmark_solution(6857) do
  PRIMES = [2]
  number = 600851475143

  def prime?(number)
    # Prime only based on the set of known primes
    return false if number < 2
    limit = Math.sqrt(number)
    PRIMES.each do |prime|
      return (PRIMES << number) if prime > limit
    end
    false
  end

  div = 2

  while number > 1 do
    if prime?(div) && number % div == 0
      number /= div
    else
      div += div.even? ? 1 : 2
    end
  end

  div
end

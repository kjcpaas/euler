require_relative "lib/helpers"

show_problem_info({
  number: 4,
  title: "Largest palindrome product",
  statement: %Q{
    A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

    Find the largest palindrome made from the product of two 3-digit numbers.
  },
  url: "https://projecteuler.net/problem=4"
})

benchmark_solution(906609) do
  def palindrome?(number)
    string = number.to_s
    0.upto((string.length - 2)/2) do |i|
      return false unless string[i] === string[-1 - i]
    end
    true
  end

  largest = 0

  999.downto(0) do |a|
    break if a ** 2 < largest
    a.downto(0) do |b|
      product = a * b
      break unless product > largest
      largest = product if palindrome?(product)
    end
  end
  largest
end

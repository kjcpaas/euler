require "integer"
require "fraction"
require "pattern_checker"

class Integer
  include PatternChecker
end

class String
  include PatternChecker
end

def check_answer(exp_ans, ans)
  puts "Answer should be: #{exp_ans}"
  puts "Your answer is #{ans}"
  puts "#{ exp_ans == ans ? 'correct' : 'wrong' }"
end

def add(array)
  array.inject { |sum, n| sum + n } || 0
end

def multiply(array)
  array.inject(1) { |product, n| product * n }
end

def parse_2d(data)
  data.split("\n").map { |row| row.split(" ").map { |n| n.to_i } }
end
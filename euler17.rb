COMMA_CONVS = [nil, "thousand", "million", "billion", "trillion"]
TENS = [nil, nil, "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
TEENAGERS = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
ONES = [nil, "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

def three_digit(num)
	word = []
	# handle case of hundreds
	if num >= 100
		word << ONES[num/100]
		word << "hundred"
		num %= 100
    word << "and" if num > 0
	end
	
	# handle case of "teenagers"
	if num > 9 and num < 20
		word << TEENAGERS[num - 10]
		return word
	end
	
	# handle case of other 2-digit numbers
	if num >= 20
		word << TENS[num/10]
		num %= 10
	end
	
	# handles 1-digit numbers
	word << ONES[num]
	return word.join(" ").strip
	
end

# -----------------------------------------------
# Groups the digits into 3-digit groups then processes each group
def num_to_word(num)
	#handle special cases
	if num < 0 or num >= 10 ** 15
		puts "#{num} is an invalid number."
	elsif num == 0
		return "zero"
	else
		word = []
		4.downto(0).each do |i|
			if num >= 10 ** (3 * i)
				# this line processes leftmost group of at most 3 digits
				word << three_digit( (num/(10 ** (3 * i)) % 1000 ) )
				# adds "thousand", "million", "billion", or "trillion
				word << COMMA_CONVS[i]
			end
		end
		return word.join(" ").strip
	end
end

#Start 
require "helpers.rb"
require "benchmark"

exp_ans = 21124
limit = 1000
total = 0

time_taken = Benchmark.measure do
  (limit + 1).times do |n|
    next if n == 0
    total += num_to_word(n).gsub(" ", "").length
  end
  
  check_answer(exp_ans, total)
end

puts "Time taken(seconds): #{time_taken}"
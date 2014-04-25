require "helpers.rb"
require "benchmark"

DAYS_PER_MONTH_NORM = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
DAYS_PER_MONTH_LEAP = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
MONTHS_PER_YEAR = 12

def is_leap(year)
  if year % 400 == 0
    return true
  elsif year % 100 == 0
    return false
  elsif year % 4 == 0
    return true
  else
    false
  end
end

exp_ans = 171
limit = 2001 #Until Dec 31, 2000

time_taken = Benchmark.measure do
  offset = is_leap(1900) ? add(DAYS_PER_MONTH_LEAP) : add(DAYS_PER_MONTH_NORM) #days in 1900
  count = offset
  ans = 0
  
  (limit - 1900).times do |diff|
    unless diff == 0
      year = diff + 1900
      MONTHS_PER_YEAR.times do |month|
        if year == 1901 and month == 0
          count += 1
        elsif is_leap(year)
          count += DAYS_PER_MONTH_LEAP[(month - 1) % MONTHS_PER_YEAR]
        else
          count += DAYS_PER_MONTH_NORM[(month - 1) % MONTHS_PER_YEAR]
        end
        
        ans += 1 if count % 7 == 0
      end
    end
  end
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"
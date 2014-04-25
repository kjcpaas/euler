require "helpers.rb"
require "benchmark"

exp_ans = 107359
FILENAME = 'euler59.txt'

time_taken = Benchmark.measure do
  ans = 0
  chars = File.read(FILENAME).split(",").map{ |word| eval(word) }
  
  #Find key using this block:
  #?a.upto(?z) do |ch1|
  #  ?a.upto(?z) do |ch2|
  #    ?a.upto(?z) do |ch3|
  #      puts "Key = #{ch1.chr}#{ch2.chr}#{ch3.chr}:"
  #      
  #      decrypted = ""
  #      index = 0
  #      
  #      [ch1, ch2, ch3].cycle do |c|
  #        break if index >= chars.length
  #        decrypted << (chars[index] ^ c).chr
  #        index += 1
  #      end
  #      
  #      puts decrypted
  #    end
  #  end
  #end
  
  puts "Key = god:"
  
  decrypted = ""
  index = 0
  
  [?g, ?o, ?d].cycle do |c|
    break if index >= chars.length
    
    ascii = chars[index] ^ c
    ans += ascii
    decrypted << ascii.chr
    
    index += 1
  end
  
  puts decrypted
  
  check_answer(exp_ans, ans)
end

puts "Time taken(seconds): #{time_taken}"

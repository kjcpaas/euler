task :default => [:run]

desc "Runs problem"
task :run do
  number = "0000#{ENV['N'] || '1'}"[-4..-1]
  Dir["euler#{number}*.rb"].each do |file|
    ruby file
  end
end

desc "Runs all files"
task :run_all do
  Dir["*.rb"].each do |file|
    ruby file
  end
end

desc "Generate primes using prime sieve"
task :sieve do
  require_relative "lib/integer_extensions"

  class Integer
    include IntegerExtensions
  end

  max = (ENV["MAX"] || 1000000).to_i
  p Integer.prime_sieve(max)
end



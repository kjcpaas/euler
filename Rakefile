task :default => [:run_all]

task :run_all do
  Dir["*.rb"].each do |file|
    ruby file
  end
end

task :sieve do
  # generate primes using prime sieve
  require_relative "lib/integer_extensions"

  class Integer
    include IntegerExtensions
  end

  max = (ENV["MAX"] || 1000000).to_i
  p Integer.prime_sieve(max)
end

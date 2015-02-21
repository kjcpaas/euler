module IntegerExtensions
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def prime_sieve(max)
      # Using Sieve of Erathostenes
      array = Array.new(max, true)
      array[0] = false
      array[1] = false

      limit = Math.sqrt(max).floor
      den = 2
      until den > Math.sqrt(max).floor do
        (2*den..max).step(den) { |n| array[n] = false }
        begin
          den += den.even? ? 1 : 2
        end until (den > Math.sqrt(max).floor) || array[den] == true
      end

      array
    end
  end
end

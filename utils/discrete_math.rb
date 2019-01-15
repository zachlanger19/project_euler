require 'benchmark'
require 'prime'

# Discrete Math Class
class DiscreteMath
  @collatz_distances = {1 => 1}
  @highly_composite_numbers = [1, 2, 4, 6, 12, 24, 36]

  def self.collatz_distances
    @collatz_distances
  end

  def self.highly_composite_numbers
    @highly_composite_numbers
  end

  def self.number_of_divisors(n)
    return 1 if n == 1
    Prime.prime_division(n).transpose[1].map {|x| x + 1}.inject(:*)
  end

  def self.collatz_distance(n)
    return @collatz_distances[n] if @collatz_distances.include?(n)
    new_n = (n % 2).zero? ? n / 2 : 3 * n + 1
    d = collatz_distance(new_n) + 1
    @collatz_distances[n] = d
    d
  end

  def self.highly_composite?(n)
    return true if @highly_composite_numbers.include?(n)
    factors, exponents = Prime.prime_division(n).transpose
    return false if exponents[-1] != 1 || factors != Prime.first(factors.length) || exponents != exponents.sort.reverse
    (1..n - 1).reverse_each do |x|
      next unless highly_composite?(x)
      if number_of_divisors(n) > number_of_divisors(x)
        @highly_composite_numbers << n
        return true
      end
      return false
    end
  end
end

# n = 50_000
# Benchmark.bm do |x|
#   x.report("1:") { n.times { arr.last } }
#   x.report("2:") { n.times { arr[-1] } }
# end

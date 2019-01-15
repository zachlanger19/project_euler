require 'prime'
start = Time.now

def factors_of(number)
  primes, powers = number.prime_division.transpose
  exponents = powers.map {|i| (0..i).to_a}
  divisors = exponents.shift.product(*exponents).map do |powers|
    primes.zip(powers).map {|prime, power| prime ** power}.inject(:*)
  end
  divisors.sort.map {|div| [div, number / div]}
end

possibleValues = (2..9999).to_a
possibleValues.reject! {|n| n.prime?}
amicableNumbers = Array.new

possibleValues.each do |n|
  multiples = factors_of(n)
  multiples.pop
  factors, trash = multiples.transpose
  sum1 = factors.inject(:+)
  multiples = factors_of(sum1)
  multiples.pop
  factors, trash = multiples.transpose
  sum2 = factors.inject(:+)
  if sum2 == n
    if sum1 != sum2
      amicableNumbers.push(n)
    end
  end
end

p amicableNumbers
p amicableNumbers.inject(:+)
puts "#{(Time.now - start) * 1000} milliseconds"
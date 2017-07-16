require 'prime'
start = Time.now

def factors_of(number)
  primes, powers = number.prime_division.transpose
  exponents = powers.map{|i| (0..i).to_a}
  divisors = exponents.shift.product(*exponents).map do |powers|
    primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
  end
  divisors.sort.map{|div| [div, number / div]}
end

foundValues = Array.new
possibleValues = (1234..9876).to_a
possibleValues.reject! { |n| n.to_s.split('').length !=  n.to_s.split('').uniq.length}
check = ['1', '2', '3', '4', '5', '6', '7', '8', '9']

(possibleValues).each do |n|
	factors_of(n).each do |a, b|
		arr = n.to_s.split('') + a.to_s.split('') + b.to_s.split('')
		if arr.sort == check
			foundValues.push(n)
		end
	end
end
p foundValues.uniq.inject(:+)
p "#{(Time.now - start) * 1000} milliseconds"
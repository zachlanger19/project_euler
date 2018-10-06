require 'prime'
start = Time.now

def relativePrimesCount(n)
	relativePrimes = n
	primeFactors = n.prime_division
	if primeFactors.length > 3
		return 1
	end
	primeFactors.each do |prime, multiple|
		relativePrimes *= 1 - ( 1.to_f / prime )
	end

	return relativePrimes.round
end

possible_values = (2..10**7).to_a#.reverse
#possible_values.reject! { |n| n.prime? }
possible_values.reject! { |n| n % 2 == 0 }
possible_values.reject! { |n| n % 3 == 0 }
possible_values.reject! { |n| n % 5 == 0 }
possible_values.reject! { |n| n % 7 == 0 }


minRatio = 100000000000
minValue = 100000000000
possible_values.each do |n|
	puts n
	count = relativePrimesCount(n)
	if n.to_s.split('').sort == count.to_s.split('').sort
		if n.to_f/count < minRatio
			minRatio = n.to_f/count
			minValue = n
		end
	end
end

puts minValue
puts "#{Time.now - start} seconds"
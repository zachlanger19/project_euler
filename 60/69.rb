require 'prime'

def relativePrimesCount(n)
	factors = n.prime_division
	relativePrimes = (1..n-1).to_a
	factors.each do |prime, multiple|
		relativePrimes.reject! {|n| n % prime == 0}
	end
	return relativePrimes.length
end

possible_values = (4..1000000).to_a #.reverse
possible_values.reject! {|n| n.prime?}
possible_values.reject! {|n| n % 2 == 1}

max = 0
possible_values.each do |n|
	relativePrimes = relativePrimesCount(n)
	if n/relativePrimes > max
		max = n/relativePrimes
		puts n
	end
end

# start = Time.now
#
# result = 1
# Prime.each(100) do |prime|
# 	if result * prime > 1000000
# 		puts result
# 		puts "#{Time.now - start} seconds"
# 		exit
# 	else
# 		result *= prime
# 	end
# end
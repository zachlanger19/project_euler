require 'prime'
start = Time.now

primes = Prime.each(1000000).to_a

index1 = 0
index2 = 0
bestConsecutive = 0
result = 0

while index1 + bestConsecutive < primes.length
	index2 = index1 + bestConsecutive
	while index2 < primes.length
		sum = 0
		primes[index1..index2].each { |n| sum += n}
		break if sum > 1000000
		if sum.prime?
			bestConsecutive = index2 - index1
			result = sum
		end
		index2 += 1
	end
	index1 += 1
end

p result
p "#{(Time.now - start)} seconds"

require 'prime'
start = Time.now

count = 0
total = 0
Prime.each do |prime|
	next if prime < 10

	truncatable = true
	truncateLeft = prime.to_s
	while truncateLeft.length > 1
		truncateLeft[0] = ''
		truncatable = false if !truncateLeft.to_i.prime?
	end
	next if !truncatable

	truncateRight = prime.to_s
	while truncateRight.length > 1
		truncateRight[-1] = ''
		truncatable = false if !truncateRight.to_i.prime?
	end
	next if !truncatable

	count += 1
	total += prime
	break if count == 11
end


p total
p "#{(Time.now - start) * 1000} milliseconds"
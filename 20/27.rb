require 'prime'
start = Time.now

mostConsecutive = 0
best = Hash.new
primes = Prime.each(999).to_a

(-999..999).each do |a|
	 primes.each do |b|
		n = 0
		until !((n * n) + (a * n) + b).prime?
			n += 1
		end
		if n > mostConsecutive
			mostConsecutive = n
			best['a'] = a
			best['b'] = b
		end

		n = 0
		until !((n * n) + (a * n) - b).prime?
			n += 1
		end
		if n > mostConsecutive
			mostConsecutive = n
			best['a'] = a
			best['b'] = -b
		end
	end
end

p best['a'] * best['b']
puts "#{(Time.now - start) * 1000} milliseconds"
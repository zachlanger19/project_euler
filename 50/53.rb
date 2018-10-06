start = Time.now

def factorial(n)
	(1..n).inject(:*) || 1
end

def combinations(n, r)
	factorial(n) / ( factorial(r) * factorial(n - r) )
end

count = 0
(23..100).each do |n|
	rMin = 1
	rMax = n
	until combinations(n, rMin) >= 1000000 || rMin > n
		rMin += 1
	end
	until combinations(n, rMax) >= 1000000 || rMax == rMin
		rMax -= 1
	end
	p n
	count += rMax - rMin + 1
end
p count
p "#{Time.now - start} seconds"
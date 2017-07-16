start = Time.now

best = 120
mostSolutions = 0
(120..1000).each do |perimeter|
	integerSolutions = 0
	(1..perimeter/2).each do |a|
		(a + 1.. perimeter/2).each do |b|
			c = perimeter - a - b
			break if c < a || c < b
			if a ** 2 + b ** 2 == c ** 2
				integerSolutions += 1
			end
		end
	end
	
	p perimeter
	if integerSolutions > mostSolutions
		mostSolutions = integerSolutions
		best = perimeter
	end
end

p best
p "#{(Time.now - start) * 1000} milliseconds"
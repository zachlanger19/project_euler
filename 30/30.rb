start = Time.now

total = 0
(2..(5 * 9**5)).each do |n|
	sum = 0
	n.to_s.split('').each { |s| sum += s.to_i**5 }
	if n == sum
		total += n
	end
end

p total
p "#{(Time.now - start) * 1000} milliseconds"
start = Time.now

best = 918273645
(9..98765).each do |n|
	next if n < best.to_s[0..n.to_s.length - 1].to_i

	str = n.to_s
	multiple = 2
	until str.length >= 9
		str += (n * multiple).to_s
	end
	next if str.length > 9
	next if str.split('').sort != ['1', '2', '3', '4', '5', '6', '7', '8', '9']

	if best < str.to_i
		best = str.to_i
	end
end

p best
p "#{(Time.now - start) * 1000} milliseconds"
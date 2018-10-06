start = Time.now

fraction = {"numerator" => 3, "denominator" => 2, "previous" => 1}

def expand(fraction)
	previous = fraction["numerator"]
	numerator = 2 * fraction["numerator"] + fraction["previous"]
	denominator = fraction["numerator"] + fraction["denominator"]
	return {"numerator" => numerator, "denominator" => denominator, "previous" => previous}
end

count = 0
iterations = 1
while iterations < 1000
	fraction = expand(fraction)
	if fraction["numerator"].to_s.length > fraction["denominator"].to_s.length
		count += 1
	end
	iterations += 1
end

puts "#{count}"

p "#{Time.now - start} seconds"
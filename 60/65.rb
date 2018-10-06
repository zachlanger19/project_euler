start = Time.now

fractions = {"num" => 3, "den" => 1, "prevNum" => 2, "prevDen" => 1, "expansion" => 2}

def expand(fractions)
	if fractions["expansion"] % 3 == 2
		k = (fractions["expansion"].to_f / 3).ceil * 2
	else
		k = 1
	end
	newNum = fractions["num"] * k + fractions["prevNum"]
	newDen = fractions["den"] * k + fractions["prevDen"]

	return {"num" => newNum, "den" => newDen, "prevNum" => fractions["num"], "prevDen" => fractions["den"], "expansion" => fractions["expansion"] + 1}
end

until fractions["expansion"] == 100
	fractions = expand(fractions)
end
sum = 0
fractions["num"].to_s.split('').each { |s| sum += s.to_i}
puts sum
puts "#{Time.now - start} seconds"
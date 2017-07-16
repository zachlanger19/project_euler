start = Time.now

total = 0
(0..9).to_a.permutation.each do |arr|
	number = arr.join().to_s
	next if number[7..9].to_i % 17 != 0
	next if number[6..8].to_i % 13 != 0
	next if number[5..7].to_i % 11 != 0
	next if number[4..6].to_i % 7 != 0
	next if number[3..5].to_i % 5 != 0
	next if number[2..4].to_i % 3 != 0
	next if number[1..3].to_i % 2 != 0
	total += number.to_i
end

p total
p "#{(Time.now - start) * 1000} milliseconds"
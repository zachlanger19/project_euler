start = Time.now

a = 1
b = 2
index = 3
50.times do
	a, b = b, a + b
	index += 1
end

while true
	a, b = b, a + b
	index += 1
	#p index
	temp = (b%1000000000).to_s.split('').sort
	if temp == ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
		p "first 9 at #{index}"
		if b.to_s[0..8].split('').sort == ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
			break
		end
	end
end

p index
puts "#{(Time.now - start) * 1000} milliseconds"
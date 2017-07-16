start = Time.now

a = 1
b = 2
sum = 2
index = 3
while b.to_s.length < 1000
	a, b = b, a + b
	index += 1
end

puts index
puts "#{(Time.now - start) * 1000} milliseconds"
start = Time.now

total = 1
counter = 1
step = 2
until step > 1000
	4.times do
		counter += step
		total += counter
	end
	step += 2
end

puts total
puts "#{(Time.now - start) * 1000} milliseconds"
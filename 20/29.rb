start = Time.now

results = Array.new
(2..100).each do |a|
	(2..100).each do |b|
		results.push(a**b)
	end
end

p results.uniq.length
puts "#{(Time.now - start) * 1000} milliseconds"
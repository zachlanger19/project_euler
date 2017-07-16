start = Time.now

sum = 0
(1..1000).each do |n|
	sum += n**n
end

p sum.to_s[-10..-1]
p "#{(Time.now - start) * 1000} milliseconds"
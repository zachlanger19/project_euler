start = Time.now

def factorial(n)
	return (1..n).to_a.inject(:*) || 1
end

total = 0
(3..99999).each do |n|
	sum = 0
	n.to_s.split('').each { |s| sum += factorial(s.to_i) }
	total += n if n == sum
end

p total
p "#{(Time.now - start) * 1000} milliseconds"
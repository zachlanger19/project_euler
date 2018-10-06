start = Time.now

possibleAvalues = (1..100).to_a
possibleBvalues = (1..100).to_a

def digitalSum(n)
	n.to_s.split('').map! { |s| s.to_i }.reduce(:+)
end

max = 0
possibleAvalues.each do |a|
	p a
	possibleBvalues.each do |b|
		sum = digitalSum(a ** b)
		if sum > max
			max = sum
		end
	end
end
p max
p "#{Time.now - start} seconds"
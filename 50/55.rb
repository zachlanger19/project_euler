start = Time.now
lychrelNumbers = 0

def lych?(n)
	50.times do
		n += n.to_s.reverse.to_i
		if n.to_s == n.to_s.reverse
			return false
		end
	end
	return true
end

(10..9999).each do |n|
	if lych?(n)
		lychrelNumbers += 1
	end
end

p lychrelNumbers
p "#{Time.now - start} seconds"
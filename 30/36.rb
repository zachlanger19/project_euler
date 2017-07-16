start = Time.now

total = 0
@powers = Array.new(20)
@powers.each_index { |i| @powers[i] = 2**i }
@powers.reverse!

def baseTwo(n)
	str = String.new
	@powers.each do |power|
		if n / power == 1
			str += '1'
		elsif n / power == 0
			if str.size > 0
				str += '0'
			end
		end
		n %= power
	end
	return str
end

total = 0
(1..999999).each do |n|
	next if n.to_s != n.to_s.reverse
	base = baseTwo(n)
	next if base != base.reverse
	total += n
end

p total
p "#{(Time.now - start) * 1000} milliseconds"
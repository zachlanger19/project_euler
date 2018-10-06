start = Time.now

def bouncy?(n)
	bouncy = true
	digits = n.to_s.split('').map { |c| c.to_i }
	if digits[0] > digits[-1]
		bouncy = false if digits.sort == digits.reverse
	elsif digits[0] > digits[-1]
		bouncy = false if digits.sort == digits
	else
		bouncy = false if digits.sort == digits
		bouncy = false if digits.sort == digits.reverse
	end
	return bouncy
end

count = 1
n = 101
while count / n.to_f < 0.99
	n += 1
	count += 1 if bouncy?(n)
end

p n
p "#{(Time.now - start) * 1000} ms"
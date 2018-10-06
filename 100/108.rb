start = Time.now

def gcd(a, b)
	r1 = a % b
	r2 = b % r1
	return r1 if r2 == 0
	r3 = r1 % r2
	while true
		return r2 if r3 == 0
		r2, r3 = r3, r3 % r2
	end
end

a = 172
b = 20

p gcd(a, b)
p "#{(Time.now - start) * 1000} ms"
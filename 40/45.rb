start = Time.now

def isPentagonal?(n)
    penTest = (Math.sqrt(1 + 24 * n) + 1.0) / 6.0
    return penTest == penTest.to_i;
end

i = 144
while true
	n = 2*i*i - i
	if isPentagonal?(n)
		p n
		abort("#{(Time.now - start) * 1000} milliseconds")
	end
	i += 1
end
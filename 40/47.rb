require 'prime'
start = Time.now

n = 1
consecutive = 0
while consecutive != 4
	if n.prime_division.length == 4
		consecutive += 1
	else
		consecutive = 0
	end

	n += 1
end

p n - 4
p "#{(Time.now - start) * 1000} milliseconds"
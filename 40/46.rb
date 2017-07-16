require 'prime'
start = Time.now

def goldbach?(n)
	return false if n.prime?
	goldbach = true
	Prime.each(n) do |prime|
		sqr = Math.sqrt((n - prime) / 2)
		return if sqr == sqr.floor
	end
	return true
end

n = 9
while true
	break if goldbach?(n)
	n += 2
end

p n
p "#{(Time.now - start) * 1000} milliseconds"
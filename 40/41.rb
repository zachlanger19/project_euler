require 'prime'
start = Time.now

pandigits = (1..9).to_a.map! { |n| n.to_s}
Prime.each(10000000).to_a.reverse.each do |prime|
	digits = prime.to_s.split('')
	next if digits.sort != pandigits[0..digits.length - 1]
	p prime
	break
end

p "#{(Time.now - start) * 1000} milliseconds"
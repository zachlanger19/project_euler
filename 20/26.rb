require 'bigdecimal'
start = Time.now

require 'prime'

def div(str = '', remainder = 10, count = 0, prime)
	if remainder/prime > 0
		str << (remainder/prime).to_s
	end
	remainder %= prime
	remainder *= 10

	if count == 8000
		return str
	else
		count += 1
		div(str, remainder, count, prime)
	end
end

primes = Prime.each(1000).to_a

strs = []

#primes.each { |a| strs.push(div(a)) }
(10..999).each { |a| strs.push(div(a)) }

def repetition (len = 50, str)
	starting_point = 2000
	if str[starting_point, len] == str[starting_point + len, len]
		return len
	elsif len > 2000
		return 0
	else
		repetition(len + 1, str)
	end
end

#puts repetition(div(617))

lens = []
strs.each { |a| lens.push(repetition(a))}
puts lens.max
puts (10..999).to_a[lens.index(lens.max)]

puts "#{(Time.now - start) * 1000} milliseconds"
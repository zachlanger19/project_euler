require 'prime'
start = Time.now

def factors_of(number)
  primes, powers = number.prime_division.transpose
  exponents = powers.map{|i| (0..i).to_a}
  divisors = exponents.shift.product(*exponents).map do |powers|
    primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
  end
  divisors.sort.map{|div| [div, number / div]}
end

abundantNumbers = Array.new

(12..28123).each do |n|
	next if n.prime?
	multiples = factors_of(n)
	# factors, trash = multiples.transpose
	# factors.pop
	# sum = factors.inject(:+)
	sum = 0
	multiples[0..-2].each { |factor1, factor2| sum += factor1 }
	if sum > n
		abundantNumbers.push(n)
	end
end

total = 0

(1..28123).each do |n|
	a = 0
	b = abundantNumbers.length - 1
	until abundantNumbers[a] + abundantNumbers[b] == n || b < a
		if abundantNumbers[a] + abundantNumbers[b] > n
			b -= 1
		elsif abundantNumbers[a] + abundantNumbers[b] < n
			a += 1
		end
	end
	if b < a
		total += n
	end
end

p total
puts "#{(Time.now - start) * 1000} milliseconds"
start = Time.now

def squareDigits(n)
	sum = 0
	n.to_s.split('').each { |s| sum += s.to_i ** 2 }
	return sum
end

def sigFigs(n)
	n.to_s.split('').sort.reject { |s| s == '0' }.join
end

testedDigits = Hash.new
eightyNines = 0

(1..10000000).each do |n|
	puts n
	original = n
	until testedDigits.include?(sigFigs(n)) || n == 89 || n == 1
		n = squareDigits(n)
	end
	if n == 89
		eightyNines += 1
		testedDigits[sigFigs(original)] = 89
	elsif n == 1
		testedDigits[sigFigs(original)] = 1
	elsif testedDigits[sigFigs(n)] == 89
		eightyNines += 1
	end
end

puts eightyNines
puts "#{Time.now - start} seconds"
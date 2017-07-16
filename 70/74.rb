start = Time.now

def factorial(n)
	(1..n).inject(:*) || 1
end

def digitalFactorialSum(n)
	sum = 0
	n.to_s.split('').each { |s| sum += factorial(s.to_i) }
	return sum
end

def nonRepeatingTerms(n)
	sequence = Hash.new
	sequenceLength = 0
	until sequence[n] == 1
		sequence[n] = 1
		n = digitalFactorialSum(n)
		sequenceLength += 1
	end
	return sequenceLength
end

count = 0
memory = Hash.new
(1..1000000).each do |n|
	digits = n.to_s.split('').sort
	if memory[digits] != nil
		sequenceLength = memory[digits]
	else
		sequenceLength = nonRepeatingTerms(n)
		memory[digits] = sequenceLength
	end
	p "#{n} : #{sequenceLength}"

	if sequenceLength == 60
		count += 1
	end
end

p count
p "#{(Time.now - start) * 1000} ms"
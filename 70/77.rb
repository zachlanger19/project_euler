require 'prime'
start = Time.now

(1..1000000).each do |value|
	target = value
	numbers = Prime.each(value).to_a
	ways = Array.new(target + 1, 0)
	ways[0] = 1;

	i = 0
	while i < numbers.length
		j = numbers[i]
		while j <= target
	        ways[j] += ways[j - numbers[i]];
	        j += 1
	   end
	   i += 1
	end

	puts "#{value}: #{ways[-1]}"
	if ways[-1] > 5000
		puts "#{Time.now - start} seconds"
		exit
	end
end
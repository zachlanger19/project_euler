target = 100
numbers = (1..100).to_a
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

puts ways[-1] - 1
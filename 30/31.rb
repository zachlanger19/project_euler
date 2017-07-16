start = Time.now

target = 200
numbers = [ 1, 2, 5, 10, 20, 50, 100, 200 ]
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

p ways[-1]
p "#{(Time.now - start) * 1000} milliseconds"
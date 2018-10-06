require 'bigdecimal'
start = Time.now

def integerArea(n1, n2)
	Math.sqrt((n1**2) - ((n2**2)/4)) % 1 == 0
end

totalPerimeter = 0
x = 5
while x + x + x - 1 < 1_000_000#_000
    p x
    # x - 1
	if Math.sqrt(x**2 - (x-1)**2/4) % 1 == 0
		# puts "#{x}, #{x}, #{x-1}, sum: #{3*x - 1}"
		# totalPerimeter += x + x + x - 1
	end
    # x + 1
	if Math.sqrt(3*x**4 + 4*x**3 - 2*x**2 - 4*x - 1) % 4 == 0
		# puts "#{x}, #{x}, #{x+1}, sum: #{3*x + 1}"
		# totalPerimeter += x + x + x + 1
	end
	x += 1
end

puts totalPerimeter
puts "#{Time.now - start} seconds"

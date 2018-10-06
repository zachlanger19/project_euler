require 'prime'
start = Time.now

squares = Prime.each( (50000000 ** ( 1.0 / 2.0 )).floor ).to_a
cubes = Prime.each( (50000000 ** ( 1.0 / 3.0 )).floor ).to_a
fourth = Prime.each( (50000000 ** ( 1.0 / 4.0 )).floor ).to_a

sums = []
squares.each do |s|
	cubes.each do |c|
		fourth.each do |f|
			sums.push( s**2 + c**3 + f**4 )
		end
	end
end

sums.reject! { |n| n >= 50000000 }
sums.uniq!
puts sums.length
puts "#{Time.now - start} seconds"
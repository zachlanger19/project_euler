cubes = Hash.new
(1..99999).each do |n|
	sorted_digits = (n ** 3).to_s.split('').sort.join
	if cubes[sorted_digits] == nil
		cubes[sorted_digits] = [1, [n]]
	else
		cubes[sorted_digits] = [cubes[sorted_digits][0] + 1, cubes[sorted_digits][1] + [n]]
	end
end

cubes.each do |digits, info|
	if info[0] == 5
		puts "#{digits} => #{info}"
	end
end
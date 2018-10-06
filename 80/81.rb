# @matrix = [[1, 2, 3, 4, 5, 6, 7, 8, 9],
# 			[1, 2, 3, 4, 5, 6, 7, 8, 9],
# 			[1, 2, 3, 4, 5, 6, 7, 8, 9],
# 			[1, 2, 3, 4, 5, 6, 7, 8, 9],
# 			[1, 2, 3, 4, 5, 6, 7, 8, 9],
# 			[1, 2, 3, 4, 5, 6, 7, 8, 9],
# 			[1, 2, 3, 4, 5, 6, 7, 8, 9],
# 			[1, 2, 3, 4, 5, 6, 7, 8, 9],
# 			[1, 2, 3, 4, 5, 6, 7, 8, 9]]

start = Time.now

@matrix = Array.new
File.open("../files/81.txt").each do |line|
    row = line.chomp.to_s.split(',').map! { |s| s.to_i }
    @matrix.push(row)
end

paths = [{'x' => 0, 'y' => 0, 'total' => 4445}]

def move(paths)
	generatedPaths = Array.new
	paths.each do |position|
		if position['x'] < @matrix[0].length - 1
			newX = position['x'] + 1
			newY = position['y']
			newTotal = position['total'] + @matrix[newY][newX]
			generatedPaths.push({'x' => newX, 'y' => newY, 'total' => newTotal})
		end
		if position['y'] < @matrix.length - 1
			newX = position['x']
			newY = position['y'] + 1
			newTotal = position['total'] + @matrix[newY][newX]
			generatedPaths.push({'x' => newX, 'y' => newY, 'total' => newTotal})
		end
	end
	return generatedPaths
end

def clean(paths)
	count = 0
	while count < paths.length - 1
		if paths[count]['x'] == paths[count + 1]['x']
			if paths[count]['total'] > paths[count + 1]['total']
				paths.delete_at(count)
			else
				paths.delete_at(count + 1)
			end
		else
			count += 1
		end
	end
	return paths
end

paths = move(paths)
paths = clean(paths)
until paths.length == 1
	paths = move(paths)
	paths = clean(paths)
end

paths.each do |hsh|
	p hsh
end

puts "#{Time.now - start} seconds"
